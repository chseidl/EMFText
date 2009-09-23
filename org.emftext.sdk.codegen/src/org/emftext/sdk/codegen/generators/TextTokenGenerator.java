package org.emftext.sdk.codegen.generators;

import static org.emftext.sdk.codegen.generators.IClassNameConstants.COMMON_TOKEN;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.STRING;
import static org.emftext.sdk.codegen.generators.IClassNameConstants.TOKEN;

import java.io.PrintWriter;

import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.composites.StringComposite;

public class TextTokenGenerator extends BaseGenerator {

	public TextTokenGenerator() {
		super();
	}

	public TextTokenGenerator(GenerationContext context) {
		super(context, EArtifact.TEXT_TOKEN);
	}

	@Override
	public boolean generate(PrintWriter out) {
		StringComposite sc = new JavaComposite();
		
		sc.add("package " + getResourcePackageName() + ";");
		
		sc.add("public class " + getResourceClassName() + " implements " + getClassNameHelper().getI_TEXT_TOKEN() + " {");
		sc.addLineBreak();
		sc.add("private final " + getClassNameHelper().getI_TEXT_RESOURCE_PLUGIN_META_INFORMATION() + " metaInformation = new " + getClassNameHelper().getMETA_INFORMATION() + "();");
		sc.add("private final " + TOKEN + " antlrToken;");
		sc.addLineBreak();
		sc.add("public " + getResourceClassName() + "(" + TOKEN + " antlrToken) {");
		sc.add("super();");
		sc.add("this.antlrToken = antlrToken;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public " + STRING + " getName() {");
		sc.add("return getTokenName(metaInformation.getTokenNames(), antlrToken.getType());");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public int getOffset() {");
		sc.add("return ((" + COMMON_TOKEN + ") antlrToken).getStartIndex();");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public int getLength() {");
		sc.add("return ((" + COMMON_TOKEN + ") antlrToken).getStopIndex() - ((" + COMMON_TOKEN + ") antlrToken).getStartIndex() + 1;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public boolean canBeUsedForSyntaxHighlighting() {");
		sc.add("int tokenType = antlrToken.getType();");
		sc.add("if (tokenType == " + TOKEN + ".EOF) {");
		sc.add("return false;");
		sc.add("}");
		sc.add("if (tokenType == " + TOKEN + ".UP) {");
		sc.add("return false;");
		sc.add("}");
		sc.add("if (tokenType == " + TOKEN + ".DOWN) {");
		sc.add("return false;");
		sc.add("}");
		sc.add("if (tokenType == " + TOKEN + ".EOR_TOKEN_TYPE) {");
		sc.add("return false;");
		sc.add("}");
		sc.add("if (tokenType == " + TOKEN + ".INVALID_TOKEN_TYPE) {");
		sc.add("return false;");
		sc.add("}");
		sc.add("return true;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public " + STRING + " getText() {");
		sc.add("return antlrToken.getText();");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public " + STRING + " getTokenName(" + STRING + "[] tokenNames, int index) {");
		sc.add("if (tokenNames == null) {");
		sc.add("return null;");
		sc.add("}");
		sc.add(STRING + " tokenName = tokenNames[index];");
		sc.add("if (tokenName != null && tokenName.startsWith(\"'\")) {");
		sc.add("tokenName = tokenName.substring(1, tokenName.length() - 1).trim();");
		sc.add("}");
		sc.add("return tokenName;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("}");

		out.write(sc.toString());
		return true;
	}

	public IGenerator newInstance(GenerationContext context) {
		return new TextTokenGenerator(context);
	}
}