/*******************************************************************************
 * Copyright (c) 2006-2009 
 * Software Technology Group, Dresden University of Technology
 * 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0 
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * 
 * Contributors:
 *   Software Technology Group - TU Dresden, Germany 
 *      - initial API and implementation
 ******************************************************************************/
package org.emftext.sdk.codegen.generators;

import static org.emftext.sdk.codegen.generators.IClassNameConstants.E_CLASS;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.E_OBJECT;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.E_OBJECT_IMPL;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.E_STRUCTURAL_FEATURE;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.HASH_MAP;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.MAP;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.OBJECT;

import java.io.PrintWriter;

import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.composites.StringComposite;

public class DummyEObjectGenerator extends JavaBaseGenerator {

	public DummyEObjectGenerator() {
		super();
	}

	private DummyEObjectGenerator(GenerationContext context) {
		super(context, EArtifact.DUMMY_E_OBJECT);
	}

	public boolean generateJavaContents(StringComposite sc, PrintWriter out) {
		
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		sc.add("// The DummyEObject is used to build a stack of dummy objects when descending");
		sc.add("// by tail recursion into left recursive rules. They cache the setting");
		sc.add("// information for initializing concrete EObject instances.");
		sc.add("//");
		sc.add("// When the tail descent is finished this stack is reduced in reverse order. The");
		sc.add("// EObjects are created using the setting informations and a containment hierarchy");
		sc.add("// is build using the left recursive EStructuralFeature.");
		sc.add("//");
		sc.add("public class " + getResourceClassName() + " extends " + E_OBJECT_IMPL + "  {");
		sc.addLineBreak();
		
		addFields(sc);
		addConstructor(sc);
		addMethods(sc);
		
		sc.add("}");
		out.print(sc.toString());
		return true;
	}

	private void addMethods(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		addApplyToMethod(sc);
		addGetValueByNameMethod(sc);
		addEClassMethod(sc);
		addESetMethod(sc);
		addToStringMethod(sc);
	}

	private void addToStringMethod(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("public String toString() {");
		sc.add("String keyValuePairs = recurseFeatureName + \": \";");
		sc.add("for (" + E_STRUCTURAL_FEATURE + " f : keyValueMap.keySet()) {");
		sc.add("keyValuePairs += f.getName() + \" = \" + keyValueMap.get(f) + \"\\n\";");
		sc.add("}");
		sc.add("return keyValuePairs;");
		sc.add("}");
	}

	private void addESetMethod(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("public void eSet(" + E_STRUCTURAL_FEATURE + " structuralFeature, " + OBJECT + " a0) {");
		sc.add("this.keyValueMap.put(structuralFeature, a0);");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addEClassMethod(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("// proxy method");
		sc.add("public " + E_CLASS + " eClass() {");
		sc.add("return type;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetValueByNameMethod(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("public " + OBJECT + " getValueByName(String name) {");
		sc.add("for (" + E_STRUCTURAL_FEATURE + " f : this.keyValueMap.keySet()) {");
		sc.add("if (f.getName().equals(name)) return this.keyValueMap.get(f);");
		sc.add("}");
		sc.add("return null;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addApplyToMethod(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("public " + E_OBJECT + " applyTo(" + E_OBJECT + " currentTarget) {");
		sc.add(E_STRUCTURAL_FEATURE + " recurseFeature = currentTarget.eClass().getEStructuralFeature(this.recurseFeatureName);");
		sc.add(E_OBJECT + " newObject = currentTarget.eClass().getEPackage().getEFactoryInstance().create(type);");
		sc.add("for (" + E_STRUCTURAL_FEATURE + " f : keyValueMap.keySet()) {");
		sc.add("" + E_STRUCTURAL_FEATURE + " structuralFeature = newObject.eClass().getEStructuralFeature(f.getName());");
		sc.add("newObject.eSet(structuralFeature, keyValueMap.get(f));");
		sc.add("}");
		sc.addLineBreak();
		sc.add("newObject.eSet(recurseFeature, currentTarget);");
		sc.add("return newObject;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addConstructor(
			org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("public " + getResourceClassName() + "(" + E_CLASS + " type, String recurseFeatureName) {");
		sc.add("this.recurseFeatureName = recurseFeatureName;");
		sc.add("this.type = type;");
		sc.add("keyValueMap = new " + HASH_MAP + "<" + E_STRUCTURAL_FEATURE + ", " + OBJECT + ">();");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addFields(org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("private " + MAP + "<" + E_STRUCTURAL_FEATURE + ", " + OBJECT + "> keyValueMap;");
		sc.add("private String recurseFeatureName;");
		sc.add("private " + E_CLASS + " type;");
		sc.addLineBreak();
	}

	public IGenerator newInstance(GenerationContext context) {
		return new DummyEObjectGenerator(context);
	}
}
