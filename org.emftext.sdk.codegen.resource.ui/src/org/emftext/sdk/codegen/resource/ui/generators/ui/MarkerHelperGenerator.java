/*******************************************************************************
 * Copyright (c) 2006-2010 
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
package org.emftext.sdk.codegen.resource.ui.generators.ui;

import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.ARRAY_LIST;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.COLLECTION;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.CORE_EXCEPTION;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.I_FILE;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.I_MARKER;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.I_RESOURCE;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.LIST;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.RESOURCE;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.RESOURCES_PLUGIN;
import static org.emftext.sdk.codegen.resource.ui.IUIClassNameConstants.RESOURCE_DIAGNOSTIC;

import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.parameters.ArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.ui.generators.UIJavaBaseGenerator;

public class MarkerHelperGenerator extends UIJavaBaseGenerator<ArtifactParameter<GenerationContext>> {

	public void generateJavaContents(JavaComposite sc) {
		
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		sc.addJavadoc(
			"Helper class to add markers to text files based on EMF's <code>" + RESOURCE_DIAGNOSTIC + "</code>. " +
			"If a resource contains <code>" + iTextDiagnosticClassName + "</code>s it uses the more precise information of " +
			"this extended diagnostic type."
		);
		sc.add("public class " + getResourceClassName() + " {");
		sc.addLineBreak();

		addFields(sc);
		addMethods(sc);
		
		sc.add("}");
	}

	private void addMethods(JavaComposite sc) {
		addMarkMethod(sc);
		addCreateMarkersFromDiagnosticsMethod(sc);
		addUnmarkMethod(sc);
	}

	private void addFields(JavaComposite sc) {
		sc.addJavadoc(
			"The extension id of the custom marker type that is used by this text resource."
		);
		sc.add("public static final String MARKER_TYPE = " + uiPluginActivatorClassName + ".PLUGIN_ID + \".problem\";");
		sc.addLineBreak();

		sc.addJavadoc(
			"The total number of markers per file is restricted with this constant. " +
			"Restriction is needed because the performance of Eclipse decreases drastically " +
			"if large amounts of markers are added to files."
		);
		sc.add("public static int MAXIMUM_MARKERS = 500;");
		sc.addLineBreak();
	}

	private void addUnmarkMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Removes all markers from a given resource.",
			"@param resource The resource where to delete markers from",
			"@throws " + CORE_EXCEPTION
		);
		sc.add("public static void unmark(" + RESOURCE + " resource) throws " + CORE_EXCEPTION + " {");
		sc.add(I_FILE + " file = (" + I_FILE + ") " + RESOURCES_PLUGIN + ".getWorkspace().getRoot().findMember(resource.getURI().toPlatformString(true));");
		sc.add("if (file != null) {");
		sc.add("file.deleteMarkers(" + markerHelperClassName + ".MARKER_TYPE, false, " + I_RESOURCE + ".DEPTH_ZERO);");
		sc.add("}");
		sc.add("}");
	}

	private void addCreateMarkersFromDiagnosticsMethod(JavaComposite sc) {
		sc.add("private static void createMarkersFromDiagnostics(" + I_FILE + " file, " + LIST + "<" + RESOURCE_DIAGNOSTIC + "> diagnostics, int markerSeverity) throws " + CORE_EXCEPTION + " {");
		sc.addLineBreak();
		sc.add("int createdMarkers = 0;");
		sc.add("for (" + RESOURCE_DIAGNOSTIC + " diagnostic : diagnostics) {");
		sc.add("try {");
		sc.add(I_MARKER + " marker = file.createMarker(MARKER_TYPE);");
		sc.add("marker.setAttribute(" + I_MARKER + ".SEVERITY, markerSeverity);");
		sc.add("marker.setAttribute(" + I_MARKER + ".MESSAGE, diagnostic.getMessage());");
		sc.add("if (diagnostic instanceof " + iTextDiagnosticClassName + ") {");
		sc.add(iTextDiagnosticClassName + " textDiagnostic = (" + iTextDiagnosticClassName + ") diagnostic;");
		sc.add("marker.setAttribute(" + I_MARKER + ".LINE_NUMBER, textDiagnostic.getLine());");
		sc.add("marker.setAttribute(" + I_MARKER + ".CHAR_START, textDiagnostic.getCharStart());");
		sc.add("marker.setAttribute(" + I_MARKER + ".CHAR_END, textDiagnostic.getCharEnd() + 1);");
		sc.add(COLLECTION + "<" + iQuickFixClassName + "> quickFixes = textDiagnostic.getProblem().getQuickFixes();");

		sc.add(COLLECTION + "<Object> sourceIDs = new " + ARRAY_LIST + "<Object>();");
		sc.add("if (quickFixes != null) {");
		sc.add("for (" + iQuickFixClassName + " quickFix : quickFixes) {");
		sc.add("if (quickFix != null) {");
		sc.add("sourceIDs.add(quickFix.getContextAsString());");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("if (!sourceIDs.isEmpty()) {");
		sc.add("marker.setAttribute(" + I_MARKER + ".SOURCE_ID, " + stringUtilClassName + ".explode(sourceIDs, \"|\"));");
		sc.add("}");
		sc.add("}");
		sc.add("else {");
		sc.add("marker.setAttribute(" + I_MARKER + ".CHAR_START, 0);");
		sc.add("marker.setAttribute(" + I_MARKER + ".CHAR_END, 1);");
		sc.add("}");
		sc.add("} catch (" + CORE_EXCEPTION + " ce) {");
		sc.add("if (ce.getMessage().matches(\"Marker.*not found.\")) {");
		sc.addComment("ignore");
		sc.add("} else {");
		sc.add("ce.printStackTrace();");
		sc.add("}");
		sc.add("}");
		sc.add("createdMarkers++;");
		sc.add("if (createdMarkers >= MAXIMUM_MARKERS) {");
		sc.add("return;");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addMarkMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Marks a file with markers.",
			"@param resource The resource that is the file to mark.",
			"@throws " + CORE_EXCEPTION
		);
		sc.add("public static void mark(" + RESOURCE + " resource) throws " + CORE_EXCEPTION + " {");
		sc.add("if (resource == null) {");
		sc.add("return;");
		sc.add("}");
		sc.add(I_FILE + " file = (" + I_FILE + ") " + RESOURCES_PLUGIN + ".getWorkspace().getRoot().findMember(resource.getURI().toPlatformString(true));");
		sc.addComment("URI might not point at a platform file");
		sc.add("if (file == null) {");
		sc.add("return;");
		sc.add("}");
		sc.add("createMarkersFromDiagnostics(file, resource.getErrors(), " + I_MARKER + ".SEVERITY_ERROR);");
		sc.add("createMarkersFromDiagnostics(file, resource.getWarnings(), " + I_MARKER + ".SEVERITY_WARNING);");
		sc.add("}");
		sc.addLineBreak();
	}

	
}
