/*******************************************************************************
 * Copyright (c) 2006-2011
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
package org.emftext.sdk.codegen.resource.generators.mopp;

import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.CORE_EXCEPTION;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.INCREMENTAL_PROJECT_BUILDER;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.I_FILE;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.I_PROGRESS_MONITOR;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.I_PROJECT;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.I_RESOURCE;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.I_RESOURCE_DELTA;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.I_RESOURCE_DELTA_VISITOR;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.MAP;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.RESOURCE_SET_IMPL;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.URI;

import org.emftext.sdk.OptionManager;
import org.emftext.sdk.codegen.annotations.SyntaxDependent;
import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.composites.StringComposite;
import org.emftext.sdk.codegen.parameters.ArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.generators.JavaBaseGenerator;
import org.emftext.sdk.codegen.util.NameUtil;
import org.emftext.sdk.concretesyntax.ConcreteSyntax;
import org.emftext.sdk.concretesyntax.OptionTypes;

@SyntaxDependent
public class BuilderAdapterGenerator extends JavaBaseGenerator<ArtifactParameter<GenerationContext>> {

	private final NameUtil nameUtil = new NameUtil();

	@Override
	public void generateJavaContents(JavaComposite sc) {
		boolean removeEclipseDependentCode = OptionManager.INSTANCE.getBooleanOptionValue(getContext().getConcreteSyntax(), OptionTypes.REMOVE_ECLIPSE_DEPENDENT_CODE);

		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		String extendsClause = removeEclipseDependentCode ? "" : " extends " + INCREMENTAL_PROJECT_BUILDER;
		sc.add("public class " + getResourceClassName() + extendsClause + " {");
		sc.addLineBreak();

		if (!removeEclipseDependentCode) {
			addFields(sc);
			addBuildMethod2(sc);
			addBuildMethod3(sc);
			addGetBuilderMethod(sc);
			addGetBuilderMarkerIdMethod(sc);
		} else {
			sc.addComment("This class is empty because option '" + OptionTypes.REMOVE_ECLIPSE_DEPENDENT_CODE.getLiteral() + "' is set to true.");
		}
		sc.add("}");
	}

	private void addFields(JavaComposite sc) {
		ConcreteSyntax syntax = getContext().getConcreteSyntax();
		String builderID = nameUtil.getBuilderID(syntax);

		sc.addJavadoc("The ID of the default, generated builder.");
		sc.add("public final static String BUILDER_ID = \"" + builderID + "\";");
		sc.addLineBreak();
		sc.add("private " + iBuilderClassName + " defaultBuilder = new " + builderClassName + "();");
		sc.addLineBreak();
	}

	private void addBuildMethod2(StringComposite sc) {
		sc.add("public " + I_PROJECT + "[] build(int kind, " + MAP + "<String, String> args, final " + I_PROGRESS_MONITOR + " monitor) throws " + CORE_EXCEPTION + " {");
		sc.add(I_RESOURCE_DELTA + " delta = getDelta(getProject());");
		sc.add("if (delta == null) {");
		sc.add("return null;");
		sc.add("}");
		sc.add("delta.accept(new " + I_RESOURCE_DELTA_VISITOR + "() {");
		sc.add("public boolean visit(" + I_RESOURCE_DELTA + " delta) throws " + CORE_EXCEPTION + " {");
		sc.add(I_RESOURCE + " resource = delta.getResource();");
		sc.add("if (delta.getKind() == " + I_RESOURCE_DELTA + ".REMOVED) {");
		sc.add(URI + " uri = " + URI + ".createPlatformResourceURI(resource.getFullPath().toString(), true);");
		sc.add(iBuilderClassName + " builder = getBuilder();");
		sc.add("if (builder.isBuildingNeeded(uri)) {");
		sc.add("builder.handleDeletion(uri, monitor);");
		sc.add("}");
    	sc.add("new " + markerHelperClassName + "().removeAllMarkers(resource, getBuilderMarkerId());");
		sc.add("return false;");
		sc.add("}");
		sc.add("if (resource instanceof " + I_FILE + " && resource.getName().endsWith(\".\" + new " + metaInformationClassName + "().getSyntaxName())) {");
		sc.add("build((" + I_FILE + ") resource, monitor);");
		sc.add("return false;");
		sc.add("}");
		sc.add("return true;");
		sc.add("}");
		sc.add("});");
		sc.add("return null;");
		sc.add("}");
		sc.addLineBreak();
	}
	
	private void addBuildMethod3(JavaComposite sc) {
		sc.add("public void build(" + I_FILE + " resource, " + I_PROGRESS_MONITOR + " monitor) {");
		sc.add(URI + " uri = " + URI + ".createPlatformResourceURI(resource.getFullPath().toString(), true);");
		sc.add(iBuilderClassName + " builder = getBuilder();");
		sc.add("if (builder.isBuildingNeeded(uri)) {");
		sc.add(textResourceClassName + " customResource = (" + textResourceClassName + ") new " + RESOURCE_SET_IMPL + "().getResource(uri, true);");
    	sc.add("new " + markerHelperClassName + "().removeAllMarkers(resource, getBuilderMarkerId());");
		sc.add("builder.build(customResource, monitor);");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetBuilderMarkerIdMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Returns the id for the markers that are created by this " +
			"builder. This allows subclasses to produce different kinds of markers."
		);
		sc.add("public String getBuilderMarkerId() {");
		sc.add("return " + markerHelperClassName + ".getMarkerID(" + eProblemTypeClassName + ".BUILDER_ERROR);");
		sc.add("}");
		sc.addLineBreak();
	}
	
	private void addGetBuilderMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Returns the builder that shall be used by this adapter. " +
			"This allows subclasses to perform builds with different builders."
		);
		sc.add("public " + iBuilderClassName + " getBuilder() {");
		sc.add("return defaultBuilder;");
		sc.add("}");
		sc.addLineBreak();
	}
}
