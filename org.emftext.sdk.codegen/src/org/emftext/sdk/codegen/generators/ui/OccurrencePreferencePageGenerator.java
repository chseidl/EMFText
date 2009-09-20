package org.emftext.sdk.codegen.generators.ui;

import static org.emftext.sdk.codegen.generators.IClassNameConstants.BUTTON;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.COLOR_SELECTOR;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.COMPOSITE;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.CONTROL;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.GRID_DATA;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.GRID_LAYOUT;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.I_EDITOR_PART;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.I_WORKBENCH;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.I_WORKBENCH_PREFERENCE_PAGE;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.LABEL;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.PREFERENCE_CONVERTER;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.PREFERENCE_PAGE;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.RGB;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.SELECTION_EVENT;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.SELECTION_LISTENER;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.SWT;

import java.io.PrintWriter;

import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.generators.BaseGenerator;

public class OccurrencePreferencePageGenerator extends BaseGenerator {

	private String pluginActivatorClassName;
	private String editorClassName;
	private String preferenceConstantsClassName;

	public OccurrencePreferencePageGenerator() {
		super();
	}

	private OccurrencePreferencePageGenerator(GenerationContext context) {
		super(context, EArtifact.OCCURRENCE_PREFERENCE_PAGE);
		pluginActivatorClassName = getContext().getQualifiedClassName(EArtifact.PLUGIN_ACTIVATOR);
		editorClassName = getContext().getQualifiedClassName(EArtifact.EDITOR);
		preferenceConstantsClassName = getContext().getQualifiedClassName(EArtifact.PREFERENCE_CONSTANTS);
	}

	public IGenerator newInstance(GenerationContext context) {
		return new OccurrencePreferencePageGenerator(context);
	}

	public boolean generate(PrintWriter out) {
		org.emftext.sdk.codegen.composites.StringComposite sc = new org.emftext.sdk.codegen.composites.JavaComposite();
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		sc.add("// The preference page to set the occurrence highlighting with folling features:");
		sc.add("// <ul>");
		sc.add("// <li>enables the occurrence highlighting</li>");
		sc.add("// <li>chooses the highlight color for definition</li>");
		sc.add("// <li>chooses the highlight color for the proxy elements</li>");
		sc.add("// </ul>");
		sc.add("//");
		sc.add("public class " + getResourceClassName() + " extends " + PREFERENCE_PAGE + " implements " + I_WORKBENCH_PREFERENCE_PAGE + " {");
		sc.addLineBreak();
		addFields(sc);
		sc.add("@Override");
		sc.add("protected " + CONTROL + " createContents(" + COMPOSITE + " parent) {");
		sc.add(COMPOSITE + " settingComposite = new " + COMPOSITE + "(parent, " + SWT + ".NONE);");
		sc.add(GRID_LAYOUT + " layout = new " + GRID_LAYOUT + "();");
		sc.add(GRID_DATA + " gd;");
		sc.add("layout.numColumns= 2;");
		sc.add("layout.marginHeight= 0;");
		sc.add("layout.marginWidth= 0;");
		sc.add("gd = new " + GRID_DATA + "(" + GRID_DATA + ".BEGINNING);");
		sc.add("settingComposite.setLayout(layout);");
		sc.add("settingComposite.setLayoutData(gd);");
		sc.addLineBreak();
		sc.add("enableCheckbox = new " + BUTTON + "(settingComposite, " + SWT + ".CHECK);");
		sc.add("enableCheckbox.setText(\"Enable\");");
		sc.add("gd = new " + GRID_DATA + "(" + GRID_DATA + ".BEGINNING);");
		sc.add("gd.horizontalAlignment= " + GRID_DATA + ".BEGINNING;");
		sc.add("gd.horizontalSpan= 2;");
		sc.add("enableCheckbox.setLayoutData(gd);");
		sc.addLineBreak();
		sc.add("defColorLabel = new " + LABEL + "(settingComposite, " + SWT + ".LEFT);");
		sc.add("defColorLabel.setText(\"Definition color:\");");
		sc.add("gd = new " + GRID_DATA + "(" + GRID_DATA + ".HORIZONTAL_ALIGN_BEGINNING);");
		sc.add("gd.horizontalIndent= 20;");
		sc.add("defColorLabel.setLayoutData(gd);");
		sc.add("defColorSelector = new " + COLOR_SELECTOR + "(settingComposite);");
		sc.add("defColorButton = defColorSelector.getButton();");
		sc.add("gd = new " + GRID_DATA + "(" + GRID_DATA + ".HORIZONTAL_ALIGN_BEGINNING);");
		sc.add("defColorButton.setLayoutData(gd);");
		sc.addLineBreak();
		sc.add("useColorLabel = new " + LABEL + "(settingComposite, " + SWT + ".LEFT);");
		sc.add("useColorLabel.setText(\"Proxy color:\");");
		sc.add("gd = new " + GRID_DATA + "(" + GRID_DATA + ".HORIZONTAL_ALIGN_BEGINNING);");
		sc.add("gd.horizontalIndent= 20;");
		sc.add("useColorLabel.setLayoutData(gd);");
		sc.add("useColorSelector = new " + COLOR_SELECTOR + "(settingComposite);");
		sc.add("useColorButton = useColorSelector.getButton();");
		sc.add("gd = new " + GRID_DATA + "(" + GRID_DATA + ".HORIZONTAL_ALIGN_BEGINNING);");
		sc.add("useColorButton.setLayoutData(gd);");
		sc.addLineBreak();
		sc.add("addListenersToStyleButtons();");
		sc.add("initializeValues();");
		sc.addLineBreak();
		sc.add("settingComposite.layout(false);");
		sc.add("return settingComposite;");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("public void init(" + I_WORKBENCH + " workbench) {");
		sc.add("setPreferenceStore(" + pluginActivatorClassName + ".getDefault().getPreferenceStore());");
		sc.add("setDescription(\"Define the highlight coloring of occurrences.\");");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("private void addListenersToStyleButtons() {");
		sc.add("enableCheckbox.addSelectionListener(new " + SELECTION_LISTENER + "(){");
		sc.add("public void widgetDefaultSelected(" + SELECTION_EVENT + " e){");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public void widgetSelected(" + SELECTION_EVENT + " e) {");
		sc.add("defColorButton.setEnabled(enableCheckbox.getSelection());");
		sc.add("useColorButton.setEnabled(enableCheckbox.getSelection());");
		sc.add("}");
		sc.add("});");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("private void initializeValues() {");
		sc.add("boolean enable = getPreferenceStore().getBoolean(" + preferenceConstantsClassName + ".EDITOR_OCCURRENCE_CHECKBOX);");
		sc.add("enableCheckbox.setSelection(enable);");
		sc.addLineBreak();
		sc.add("defColorButton.setEnabled(enable);");
		sc.add("" + RGB + " rgb = " + PREFERENCE_CONVERTER + ".getColor(getPreferenceStore(), " + preferenceConstantsClassName + ".EDITOR_DEFINITION_COLOR);");
		sc.add("defColorSelector.setColorValue(rgb);");
		sc.addLineBreak();
		sc.add("useColorButton.setEnabled(enable);");
		sc.add("rgb = " + PREFERENCE_CONVERTER + ".getColor(getPreferenceStore(), " + preferenceConstantsClassName + ".EDITOR_PROXY_COLOR);");
		sc.add("useColorSelector.setColorValue(rgb);");
		sc.add("}");
		sc.addLineBreak();
		sc.add("// Set the default values for this preference page.");
		sc.add("protected void performDefaults() {");
		sc.add("boolean enable = getPreferenceStore().getDefaultBoolean(" + preferenceConstantsClassName + ".EDITOR_MATCHING_BRACKETS_CHECKBOX);");
		sc.add("enableCheckbox.setSelection(enable);");
		sc.add("defColorButton.setEnabled(enable);");
		sc.add("useColorButton.setEnabled(enable);");
		sc.add("defColorSelector.setColorValue(" + PREFERENCE_CONVERTER + ".getDefaultColor(getPreferenceStore(), " + preferenceConstantsClassName + ".EDITOR_DEFINITION_COLOR));");
		sc.add("useColorSelector.setColorValue(" + PREFERENCE_CONVERTER + ".getDefaultColor(getPreferenceStore(), " + preferenceConstantsClassName + ".EDITOR_PROXY_COLOR));");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("public boolean performOk() {");
		sc.add("if(!super.performOk()) {");
		sc.add("return false;");
		sc.add("}");
		sc.add("updateActiveEditor();");
		sc.add("return true;");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("protected void performApply() {");
		sc.add("updateActiveEditor();");
		sc.add("}");
		sc.add("// Sets the chosen options to the preference store and refreshs it in the editor.");
		sc.add("private void updateActiveEditor() {");
		sc.add("getPreferenceStore().setValue(" + preferenceConstantsClassName + ".EDITOR_OCCURRENCE_CHECKBOX, enableCheckbox.getSelection());");
		sc.add(PREFERENCE_CONVERTER + ".setValue(getPreferenceStore(), " + preferenceConstantsClassName + ".EDITOR_DEFINITION_COLOR, defColorSelector.getColorValue());");
		sc.add(PREFERENCE_CONVERTER + ".setValue(getPreferenceStore(), " + preferenceConstantsClassName + ".EDITOR_PROXY_COLOR, useColorSelector.getColorValue());");
		sc.addLineBreak();
		sc.add(I_WORKBENCH + " workbench = org.eclipse.ui.PlatformUI.getWorkbench();");
		sc.add(I_EDITOR_PART + " editor = workbench.getActiveWorkbenchWindow().getActivePage().getActiveEditor();");
		sc.add("if (editor != null && editor instanceof " + editorClassName + ") {");
		sc.add("((" + editorClassName + ") editor).invalidateTextRepresentation();");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		out.print(sc.toString());
		return true;
	}

	private void addFields(org.emftext.sdk.codegen.composites.StringComposite sc) {
		sc.add("private " + BUTTON + " enableCheckbox;");
		sc.add("private " + LABEL + " defColorLabel;");
		sc.add("private " + COLOR_SELECTOR + " defColorSelector;");
		sc.add("private " + BUTTON + " defColorButton;");
		sc.add("private " + LABEL + " useColorLabel;");
		sc.add("private " + COLOR_SELECTOR + " useColorSelector;");
		sc.add("private " + BUTTON + " useColorButton;");
		sc.addLineBreak();
	}
}