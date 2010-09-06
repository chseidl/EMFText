package org.emftext.sdk.codegen.resource.generators.mopp;

import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.parameters.ArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.generators.JavaBaseGenerator;
import org.emftext.sdk.concretesyntax.OptionTypes;

public class DynamicTokenStylerGenerator extends JavaBaseGenerator<ArtifactParameter<GenerationContext>> {

	@Override
	public void generateJavaContents(JavaComposite sc) {
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		sc.add("public class " + getResourceClassName() + " {");
		sc.addLineBreak();
		addGetDynamicTokenStyleMethod(sc);
		sc.add("}");
	}

	private void addGetDynamicTokenStyleMethod(JavaComposite sc) {
		sc.addJavadoc(
			"This method is called to dynamically style tokens.",
			"@param resource the TextResource that contains the token",
			"@param tokenName the name of the token",
			"@param tokenText the text of the token",
			"@param staticStyle the token style as set in the editor preferences (is <code>null</code> if syntax highlighting for the token is disabled)"
		);
		sc.add("public " + iTokenStyleClassName + " getDynamicTokenStyle(" + iTextResourceClassName + " resource, String tokenName, String tokenText, " + iTokenStyleClassName + " staticStyle) {");
		sc.addComment(
			"The default implementation returns the static style without any changes. " +
			"To implement dynamic token styling, set the " + OptionTypes.OVERRIDE_DYNAMIC_TOKEN_STYLER.getLiteral() + 
			" option to <code>false</code> and customize this method."
		);
		sc.add("return staticStyle;");
		sc.add("}");
		sc.addLineBreak();
	}
}