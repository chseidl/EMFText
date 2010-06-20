package org.emftext.sdk.codegen.resource.ui.generators;

import org.emftext.sdk.codegen.IArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.generators.ResourceBaseGenerator;
import org.emftext.sdk.codegen.resource.ui.TextResourceUIArtifacts;

public abstract class UIResourceBaseGenerator<ParameterType extends IArtifactParameter<GenerationContext, ParameterType>> extends ResourceBaseGenerator<ParameterType> {

	protected String antlrTokenHelperClassName;
	protected String backgroundParsingStrategyClassName;
	protected String bracketPreferencePageClassName;
	protected String bracketSetClassName;
	protected String browserInformationControlClassName;
	protected String codeCompletionHelperClassName;
	protected String codeFoldingManagerClassName;
	protected String colorManagerClassName;
	protected String completionProcessorClassName;
	protected String completionProposalClassName;
	protected String defaultHoverTextProviderClassName;
	protected String docBrowserInformationControlInputClassName;
	protected String eObjectSelectionClassName;
	protected String editorClassName;
	protected String editorConfigurationClassName;
	protected String highlightingClassName;
	protected String hoverTextProviderClassName;
	protected String htmlPrinterClassName;
	protected String hyperlinkClassName;
	protected String hyperlinkDetectorClassName;
	protected String iBracketHandlerClassName;
	protected String markerHelperClassName;
	protected String newFileWizardClassName;
	protected String newFileWizardPageClassName;
	protected String occurenceClassName;
	protected String occurrencePreferencePageClassName;
	protected String outlinePageClassName;
	protected String outlinePageTreeViewerClassName;
	protected String pixelConverterClassName;
	protected String positionCategoryClassName;
	protected String positionHelperClassName;
	protected String preferenceConstantsClassName;
	protected String preferenceInitializerClassName;
	protected String preferencePageClassName;
	protected String propertySheetPageClassName;
	protected String syntaxColoringHelperClassName;
	protected String syntaxColoringPreferencePageClassName;
	protected String textHoverClassName;
	protected String tokenScannerClassName;
	protected String uiMetaInformationClassName;
	protected String uiPluginActivatorClassName;

	@Override
	protected void initilizeClassNames() {
		super.initilizeClassNames();
		GenerationContext context = getContext();
		antlrTokenHelperClassName = context.getQualifiedClassName(TextResourceUIArtifacts.ANTLR_TOKEN_HELPER);
		backgroundParsingStrategyClassName = context.getQualifiedClassName(TextResourceUIArtifacts.BACKGROUND_PARSING_STRATEGY);
		bracketPreferencePageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.BRACKET_PREFERENCE_PAGE);
		bracketSetClassName = context.getQualifiedClassName(TextResourceUIArtifacts.BRACKET_SET);
		browserInformationControlClassName = context.getQualifiedClassName(TextResourceUIArtifacts.BROWSER_INFORMATION_CONTROL);
		codeCompletionHelperClassName = context.getQualifiedClassName(TextResourceUIArtifacts.CODE_COMPLETION_HELPER);
		codeFoldingManagerClassName = context.getQualifiedClassName(TextResourceUIArtifacts.CODE_FOLDING_MANAGER);
		colorManagerClassName = context.getQualifiedClassName(TextResourceUIArtifacts.COLOR_MANAGER);
		completionProcessorClassName = context.getQualifiedClassName(TextResourceUIArtifacts.COMPLETION_PROCESSOR);
		completionProposalClassName = context.getQualifiedClassName(TextResourceUIArtifacts.COMPLETION_PROPOSAL);
		defaultHoverTextProviderClassName = context.getQualifiedClassName(TextResourceUIArtifacts.DEFAULT_HOVER_TEXT_PROVIDER);
		docBrowserInformationControlInputClassName = context.getQualifiedClassName(TextResourceUIArtifacts.DOC_BROWSER_INFORMATION_CONTROL_INPUT);
		eObjectSelectionClassName = context.getQualifiedClassName(TextResourceUIArtifacts.E_OBJECT_SELECTION);
		editorClassName = context.getQualifiedClassName(TextResourceUIArtifacts.EDITOR);
		editorConfigurationClassName = context.getQualifiedClassName(TextResourceUIArtifacts.EDITOR_CONFIGURATION);
		highlightingClassName = context.getQualifiedClassName(TextResourceUIArtifacts.HIGHLIGHTING);
		hoverTextProviderClassName = context.getQualifiedClassName(TextResourceUIArtifacts.HOVER_TEXT_PROVIDER);
		htmlPrinterClassName = context.getQualifiedClassName(TextResourceUIArtifacts.HTML_PRINTER);
		hyperlinkClassName = context.getQualifiedClassName(TextResourceUIArtifacts.HYPERLINK);
		hyperlinkDetectorClassName = context.getQualifiedClassName(TextResourceUIArtifacts.HYPERLINK_DETECTOR);
		iBracketHandlerClassName = context.getQualifiedClassName(TextResourceUIArtifacts.I_BACKET_HANDLER);
		markerHelperClassName = context.getQualifiedClassName(TextResourceUIArtifacts.MARKER_HELPER);
		newFileWizardClassName = context.getQualifiedClassName(TextResourceUIArtifacts.NEW_FILE_WIZARD);
		newFileWizardPageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.NEW_FILE_WIZARD_PAGE);
		occurenceClassName = context.getQualifiedClassName(TextResourceUIArtifacts.OCCURENCE);
		occurrencePreferencePageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.OCCURRENCE_PREFERENCE_PAGE);
		outlinePageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.OUTLINE_PAGE);
		outlinePageTreeViewerClassName = context.getQualifiedClassName(TextResourceUIArtifacts.OUTLINE_PAGE_TREE_VIEWER);
		pixelConverterClassName = context.getQualifiedClassName(TextResourceUIArtifacts.PIXEL_CONVERTER);
		positionCategoryClassName = context.getQualifiedClassName(TextResourceUIArtifacts.POSITION_CATEGORY);
		positionHelperClassName = context.getQualifiedClassName(TextResourceUIArtifacts.POSITION_HELPER);
		preferenceConstantsClassName = context.getQualifiedClassName(TextResourceUIArtifacts.PREFERENCE_CONSTANTS);
		preferenceInitializerClassName = context.getQualifiedClassName(TextResourceUIArtifacts.PREFERENCE_INITIALIZER);
		preferencePageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.PREFERENCE_PAGE);
		propertySheetPageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.PROPERTY_SHEET_PAGE);
		syntaxColoringHelperClassName = context.getQualifiedClassName(TextResourceUIArtifacts.SYNTAX_COLORING_HELPER);
		syntaxColoringPreferencePageClassName = context.getQualifiedClassName(TextResourceUIArtifacts.SYNTAX_COLORING_PREFERENCE_PAGE);
		textHoverClassName = context.getQualifiedClassName(TextResourceUIArtifacts.TEXT_HOVER);
		tokenScannerClassName = context.getQualifiedClassName(TextResourceUIArtifacts.TOKEN_SCANNER);
		uiMetaInformationClassName = context.getQualifiedClassName(TextResourceUIArtifacts.UI_META_INFORMATION);
		uiPluginActivatorClassName = context.getQualifiedClassName(TextResourceUIArtifacts.UI_PLUGIN_ACTIVATOR);
	}
}
