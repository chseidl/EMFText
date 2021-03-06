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
package org.emftext.test.syntax_extension;

import static org.emftext.test.ConcreteSyntaxTestHelper.registerResourceFactories;

import java.io.File;
import java.util.List;

import junit.framework.TestCase;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.TreeIterator;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource.Diagnostic;
import org.emftext.sdk.concretesyntax.ConcreteSyntax;
import org.emftext.sdk.concretesyntax.Definition;
import org.emftext.sdk.concretesyntax.Import;
import org.emftext.sdk.concretesyntax.Placeholder;
import org.emftext.sdk.concretesyntax.Rule;
import org.emftext.sdk.concretesyntax.Sequence;
import org.emftext.sdk.concretesyntax.resource.cs.ICsTextResource;
import org.emftext.sdk.concretesyntax.resource.cs.util.CsResourceUtil;
import org.emftext.test.PluginTestHelper;
import org.junit.Before;
import org.junit.Test;

/**
 * A test for the extension that are performed by post processors when
 * CS specification are loaded.
 */
public class SyntaxExtensionTest extends TestCase {

	@Before
	public void setUp() {
		registerResourceFactories();
	}

	@Test
	public void testTokenExtensions() {
		checkTokenReference("extension1a.cs", 2, 3);
		checkTokenReference("extension1b.cs", 2, 4);
		checkTokenReference("extension1c.cs", 3, 4);
		checkTokenReference("extension1d.cs", 2, 1);
		checkTokenReference("extension1e.cs", 2, 1);
		checkTokenReference("extension1f.cs", 2, 1);
	}

	private void checkTokenReference(String filename, int expectedPartsInRuleOne, int expectedNumberOfTokenDefinitions) {
		System.out.println("checkTokenReference(" + filename + ")");
		String pluginRootPath = new PluginTestHelper().getPluginRootPath(getClass());
		final String path = pluginRootPath + File.separator + "src" + File.separator + "org" + File.separator + "emftext" + File.separator + "test" + File.separator + "syntax_extension" + File.separator;
		File file = new File(path + filename);

		ICsTextResource resource = CsResourceUtil.getResource(file);
		assertNotNull(resource);
		EList<Diagnostic> errors = resource.getErrors();
		for (Diagnostic error : errors) {
			System.out.println("Error in resource " + error.getMessage());
		}
		assertEquals(0, errors.size());

		List<EObject> contents = resource.getContents();
		assertNotNull(contents);

		assertEquals(1, contents.size());

		EObject root = contents.get(0);
		assertTrue(root instanceof ConcreteSyntax);

		ConcreteSyntax syntax = (ConcreteSyntax) root;
		assertEquals(expectedNumberOfTokenDefinitions, syntax.getActiveTokens().size());

		List<Rule> rules = syntax.getAllRules();

		assertEquals(2, rules.size());

		Rule firstRule = rules.get(0);
		List<Sequence> options = firstRule.getDefinition().getOptions();
		assertEquals(1, options.size());

		Sequence sequence = options.get(0);
		List<Definition> parts = sequence.getParts();
		assertEquals(expectedPartsInRuleOne, parts.size());

		assertAllTokensReferencesAreSet(syntax);
	}

	private void assertAllTokensReferencesAreSet(ConcreteSyntax syntax) {
		assertAllTokenReferencesAreSetExcludingImports(syntax);
		List<Import> imports = syntax.getImports();
		for (Import nextImport : imports) {
			ConcreteSyntax importedSyntax = nextImport.getConcreteSyntax();
			if (importedSyntax != null) {
				assertAllTokensReferencesAreSet(importedSyntax);
			}
		}
	}

	private void assertAllTokenReferencesAreSetExcludingImports(
			ConcreteSyntax syntax) {
		TreeIterator<EObject> contentIterator = syntax.eAllContents();
		while (contentIterator.hasNext()) {
			EObject next = contentIterator.next();
			if (next instanceof Placeholder) {
				Placeholder placeholder = (Placeholder) next;
				assertNotNull("The token for " + placeholder + " (feature \"" + placeholder.getFeature().getName() + "\") should be set.", placeholder.getToken());
			}
		}
	}
}
