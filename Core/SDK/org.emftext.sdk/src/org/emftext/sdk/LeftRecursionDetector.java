/*******************************************************************************
 * Copyright (c) 2006-2012
 * Software Technology Group, Dresden University of Technology
 * DevBoost GmbH, Berlin, Amtsgericht Charlottenburg, HRB 140026
 * 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *   Software Technology Group - TU Dresden, Germany;
 *   DevBoost GmbH - Berlin, Germany
 *      - initial API and implementation
 ******************************************************************************/
package org.emftext.sdk;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.eclipse.emf.codegen.ecore.genmodel.GenClass;
import org.eclipse.emf.codegen.ecore.genmodel.GenFeature;
import org.emftext.sdk.concretesyntax.Choice;
import org.emftext.sdk.concretesyntax.CompoundDefinition;
import org.emftext.sdk.concretesyntax.ConcreteSyntax;
import org.emftext.sdk.concretesyntax.Containment;
import org.emftext.sdk.concretesyntax.Definition;
import org.emftext.sdk.concretesyntax.GenClassCache;
import org.emftext.sdk.concretesyntax.LineBreak;
import org.emftext.sdk.concretesyntax.Rule;
import org.emftext.sdk.concretesyntax.Sequence;
import org.emftext.sdk.concretesyntax.WhiteSpaces;

/** 
 * Checks whether the given Concrete Syntax definition contains left-recursive rules.
 * It currently detects direct left recursion and a subset of indirect left recursive rules.
 */
public class LeftRecursionDetector {

	private final Map<String, Collection<String>> genClassNames2superNames;
	private final ConcreteSyntax syntax;

	public LeftRecursionDetector(
			Map<String, Collection<String>> genClassNames2superNames, ConcreteSyntax syntax) {
		this.genClassNames2superNames = genClassNames2superNames;
		this.syntax = syntax;
	}

	public Rule findLeftRecursion(Rule rule) {
    	Rule leftProducingRule = findLeftProducingRule(rule.getMetaclass(), rule);
    	return leftProducingRule; 
	}
    
    private Rule findLeftProducingRule(GenClass metaclass, Rule rule) {
    	if (rule == null) {
    		return null;
    	}
    	return findLeftProducingRule(metaclass, rule.getDefinition(), rule); 
	}

	private Rule findLeftProducingRule(GenClass metaclass, Choice choice, Rule currentRule) {
		for (Sequence sequence : choice.getOptions()) {
			Rule leftProducingRule = findLeftProducingRule(metaclass, sequence, currentRule);
			if (leftProducingRule != null) {
				return leftProducingRule;
			}
		}
		return null;
	}

	public Rule findLeftProducingRule(GenClass metaclass, Sequence sequence, Rule currentRule) {
		GenClassCache genClassCache = currentRule.getSyntax().getGenClassCache();
		for (Definition definition : sequence.getParts()) {
			if (definition instanceof Containment) {
				Containment containment = (Containment) definition;
				final GenFeature feature = containment.getFeature();
				if (feature == null) {
					continue;
				}
				if (feature.getEcoreFeature() == null) {
					continue;
				}
				
				Collection<GenClass> featureTypes = containment.getAllowedSubTypes();
				if (featureTypes.contains(metaclass) || 
					isSubtypeofOneOf(metaclass, featureTypes, genClassCache)) {
					return currentRule;
				} else {
					Rule featureRule = null;
					List<Rule> allRules = syntax.getAllRules();
					for (Rule rule : allRules) {
						if (featureTypes.contains(rule.getMetaclass())) {
							featureRule = rule;
						}
					}
					if (currentRule.equals(featureRule) ) {
						if (genClassNames2superNames.get(genClassCache.getQualifiedInterfaceName(metaclass)).contains(genClassCache.getQualifiedInterfaceName(currentRule.getMetaclass()))) {
							return featureRule;
						}
						else return null; // we have found a recursion, but not for the type we started from
					}
					
					Rule leftProducingRule = findLeftProducingRule(metaclass, featureRule);
					if (leftProducingRule != null) {
						return leftProducingRule;
					}
				}
			}
			else if (definition instanceof CompoundDefinition) {
				CompoundDefinition compound = (CompoundDefinition) definition;
				Rule leftProducingRule = findLeftProducingRule(metaclass, compound.getDefinition(), currentRule);
				if (leftProducingRule != null) {
					return leftProducingRule;
				}
			}
			// ignore formatting operators
			if (definition instanceof LineBreak) {
				continue;
			}
			if (definition instanceof WhiteSpaces) {
				continue;
			}
			if (definition.hasMinimalCardinalityOneOrHigher()) {
				break;
			}
		}
		return null;
	}

	private boolean isSubtypeofOneOf(GenClass metaclass, Collection<GenClass> featureTypes, GenClassCache genClassCache) {
		String metaclassName = genClassCache.getQualifiedInterfaceName(metaclass);
		Collection<String> superNames = genClassNames2superNames.get(metaclassName);
		for (GenClass featureType : featureTypes) {
			// skip if this is a proxy
			if (featureType.getEcoreClass() == null) {
				continue;
			}
			String featureTypeName = genClassCache.getQualifiedInterfaceName(featureType);
			if (superNames.contains(featureTypeName)) {
				return true;
			}
		}
	
		return false;
	}

	public boolean isDirectLeftRecursive(Rule rule) {
		GenClassCache genClassCache = rule.getSyntax().getGenClassCache();
		boolean isDirectLeftRecursive = false;
		GenClass metaclass = rule.getMetaclass();
		List<Sequence> options = rule.getDefinition().getOptions();
		GenFeature recursiveFeature = null;
		for (Sequence sequence : options) {
			Rule leftProducingRule = findLeftProducingRule(metaclass, sequence, rule);
			if (leftProducingRule == null) {
				continue; // choice option not lr
			} else if (!rule.equals(leftProducingRule)) {
				return false; // choice option indirect lr 
			} else if (sequence.getParts().get(0) instanceof Containment) {
				// we found a recursion, now it
				// needs to start with recursive 
				// containment to be direct left recursive
				Containment containment = (Containment) sequence.getParts().get(0);
				GenFeature feature = containment.getFeature();
				GenClass featureType = feature.getTypeGenClass();
				if (metaclass.equals(featureType) || 
						genClassNames2superNames.get(genClassCache.getQualifiedInterfaceName(metaclass)).contains(genClassCache.getQualifiedInterfaceName(featureType))) {
					isDirectLeftRecursive = true;
					
					if (recursiveFeature == null) {
						recursiveFeature = feature;
					} else if (!recursiveFeature.equals(feature)) {
						return false; // found recursion on another feature, this is not supported
					}
					continue;
				} 
				else {
					return false; // wrong containment type
				}
			}
			else {
				return false; // recursive option which does not start with recursive containment
			}
		}
		
		return isDirectLeftRecursive;
	}
}
