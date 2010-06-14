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
package org.emftext.sdk.codegen.resource.generators.util;

import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.COLLECTION;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.ITERATOR;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.MATCHER;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.PATTERN;

import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.composites.StringComposite;
import org.emftext.sdk.codegen.parameters.ArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.generators.JavaBaseGenerator;

public class StringUtilGenerator extends JavaBaseGenerator<ArtifactParameter<GenerationContext>> {

	public void generateJavaContents(JavaComposite sc) {
		
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		
		sc.addJavadoc(
			"A utility class that provides some common methods to work " +
			"with Strings."
		);
		sc.add("public class " + getResourceClassName() + " {");
		sc.addLineBreak();
		addConstants(sc);
		addMethods(sc);
		sc.add("}");
	}

	private void addMethods(JavaComposite sc) {
		addCapitalizeMethod(sc);
		addGetMissingTailMethod(sc);
		addConvertAllCapsToCamelCaseMethod(sc);
		addExplodeMethod(sc);
		addFormatTokenNameMethod(sc);
		addGetLineMethod(sc);
		addGetCharPositionInLineMethod(sc);
		addGetLineAndCharPositionMethod(sc);
		addEscapeQuotesMethod(sc);
		addConvertCamelCaseToAllCapsMethod(sc);
		addEscapeToJavaStringMethod(sc);
		addEscapeToANTLRKeywordMethod(sc);
		addIsUnicodeSequenceMethod(sc);
		addMatchCamelCaseMethod(sc);
	}

	private void addConstants(JavaComposite sc) {
		sc.add("public final static String HEX_DIGIT_REGEXP = \"[0-9a-fA-F]\";");
		sc.add("public final static String UNICODE_SEQUENCE_REGEXP = \"\\\\\\\\u\" + HEX_DIGIT_REGEXP + HEX_DIGIT_REGEXP + HEX_DIGIT_REGEXP + HEX_DIGIT_REGEXP;");
		sc.add("public final static String ESC_OTHER = \"\\\\\\\\(n|r|t|b|f|\\\"|'|>)\";");
		sc.add("public final static String ESC_REGEXP = \"\\\\A((\" + UNICODE_SEQUENCE_REGEXP + \")|(\" + ESC_OTHER + \")).*\";");
		sc.addLineBreak();
	}

	private void addCapitalizeMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Capitalizes the first letter of the given string.",
			"@param text the string to capitalize.",
			"@return the modified string."
		);
		sc.add("public static String capitalize(String text) {");
		sc.add("String h = text.substring(0, 1).toUpperCase();");
		sc.add("String t = text.substring(1);");
		sc.add("return h + t;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetMissingTailMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Returns the part of 'tail' that is not present at the end of " +
			"'text'. For example if text = 'abc' and tail = 'cd' this method " +
			"returns 'd'. If 'tail' can not be found at the end of 'text', " +
			"'tail' is returned as is."
		);
		sc.add("public static String getMissingTail(String text, String tail) {");
		sc.add("for (int i = 1; i < tail.length(); i++) {");
		sc.add("int endIndex = text.length();");
		sc.add("int end = Math.max(0, endIndex);");
		sc.add("int start = Math.max(0, end - i);");
		sc.add("String contentTail = text.substring(start, end);");
		sc.add("String proposalHead = tail.substring(0, i);");
		sc.add("if (contentTail.equals(proposalHead)) {");
		sc.add("return tail.substring(i);");
		sc.add("}");
		sc.add("}");
		sc.add("return tail;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addConvertAllCapsToCamelCaseMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Converts a string that contains upper-case letter and " +
			"underscores (e.g., constant names) to a camel-case string. " +
			"For example, MY_CONSTANT is converted to myConstant.",
			"@param text the string to convert",
			"@return a camel-case version of text"
		);
		sc.add("public static String convertAllCapsToLowerCamelCase(String text) {");
		sc.add("String lowerCase = text.toLowerCase();");
		sc.add("while (true) {");
		sc.add("int i = lowerCase.indexOf('_');");
		sc.add("if (i < 0) {");
		sc.add("break;");
		sc.add("}");
		sc.add("String head = lowerCase.substring(0, i);");
		sc.add("if (i + 1 == lowerCase.length()) {");
		sc.add("lowerCase = head;");
		sc.add("break;");
		sc.add("} else {");
		sc.add("char charAfterUnderscore = lowerCase.charAt(i + 1);");
		sc.add("char upperCase = Character.toUpperCase(charAfterUnderscore);");
		sc.add("if (i + 2 < lowerCase.length()) {");
		sc.add("String tail = lowerCase.substring(i + 2, lowerCase.length());");
		sc.add("lowerCase = head + upperCase + tail;");
		sc.add("} else {");
		sc.add("lowerCase = head + upperCase;");
		sc.add("break;");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("return lowerCase;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addExplodeMethod(JavaComposite sc) {
		sc.addJavadoc("Concatenates the given parts and puts 'glue' between them.");
		sc.add("public static String explode(" + COLLECTION + "<String> parts, String glue) {");
		sc.add("StringBuilder sb = new StringBuilder();");
		sc.add(ITERATOR + "<String> it = parts.iterator();");
		sc.add("while (it.hasNext()) {");
		sc.add("String next = it.next();");
		sc.add("sb.append(next);");
		sc.add("if (it.hasNext()) {");
		sc.add("sb.append(glue);");
		sc.add("}");
		sc.add("}");
		sc.add("return sb.toString();");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addFormatTokenNameMethod(JavaComposite sc) {
		sc.addJavadoc("Removes single quotes at the start and end of tokenName.");
		sc.add("public static String formatTokenName(String tokenName) {");
		sc.add("if (tokenName.length() > 0 && tokenName.startsWith(\"'\")) {");
		sc.add("tokenName = tokenName.substring(1, tokenName.length());");
		sc.add("}");
		sc.add("if (tokenName.length() > 0 && tokenName.endsWith(\"'\")) {");
		sc.add("tokenName = tokenName.substring(0, tokenName.length() - 1);");
		sc.add("}");
		sc.add("return tokenName;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetLineMethod(JavaComposite sc) {
		sc.add("public static int getLine(String text, int offset) {");
		sc.add("return getLineAndCharPosition(text, offset)[0];");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetCharPositionInLineMethod(JavaComposite sc) {
		sc.add("public static int getCharPositionInLine(String text, int offset) {");
		sc.add("return getLineAndCharPosition(text, offset)[1];");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetLineAndCharPositionMethod(JavaComposite sc) {
		sc.add("public static Integer[] getLineAndCharPosition(String text, int offset) {");
		sc.add("int index = 0;");
		sc.add("int line = 0;");
		sc.add("int positionInLine = 0;");
		sc.add("while (true) {");
		sc.add("line++;");
		sc.add("positionInLine = offset - index + 1;");
		sc.add("int nextN = text.indexOf(\"\\n\", index);");
		sc.add("int nextR = text.indexOf(\"\\r\", index);");
		sc.add("int nextNorR = Integer.MAX_VALUE;");
		sc.add("if (nextN >= 0) {");
		sc.add("nextNorR = nextN;");
		sc.add("} else if (nextR >= 0 && nextR < nextNorR) {");
		sc.add("nextNorR = nextR;");
		sc.add("} else {");
		sc.addComment("found no EOL character");
		sc.add("break;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("index = nextNorR + 1;");
		sc.add("if (index == nextN) {");
		sc.add("index++;");
		sc.add("}");
		sc.add("if (index == nextR) {");
		sc.add("index++;");
		sc.add("}");
		sc.add("if (index > offset) {");
		sc.add("break;");
		sc.add("}");
		sc.add("}");
		sc.add("return new Integer[] {line, positionInLine};");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addEscapeQuotesMethod(JavaComposite sc) {
		sc.add("public static String escapeQuotes(String s) {");
		sc.add("s = s.replace(\"\\\\\", \"\\\\\\\\\");");
		sc.add("s = s.replace(\"\\\"\", \"\\\\\\\"\");");
		sc.addLineBreak();
		sc.add("return s;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addConvertCamelCaseToAllCapsMethod(JavaComposite sc) {
		sc.add("public static String convertCamelCaseToAllCaps(String qualifiedClassName) {");
		sc.add("StringBuffer sb = new StringBuffer();");
		sc.add("final char[] charArray = qualifiedClassName.toCharArray();");
		sc.add("for (int c = 0; c < charArray.length; c++) {");
		sc.add("char character = charArray[c];");
		sc.add("final boolean isEnd = c + 1 == charArray.length;");
		sc.add("boolean nextIsUpper = !isEnd && Character.isUpperCase(charArray[c + 1]);");
		sc.add("boolean nextNextIsLower = c + 2 < (charArray.length) && Character.isLowerCase(charArray[c + 2]);");
		sc.addLineBreak();
		sc.add("sb.append(Character.toUpperCase(character));");
		sc.add("if (Character.isLowerCase(character) && nextIsUpper) {");
		sc.add("sb.append('_');");
		sc.add("} else {");
		sc.add("if (nextIsUpper && nextNextIsLower) {");
		sc.add("sb.append('_');");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("return sb.toString();");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addEscapeToJavaStringMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Escapes the given text such that it can be safely embedded in a string " +
			"literal in Java source code.",
			"@param text the text to escape",
			"@return the escaped text"
		);
		sc.add("public static String escapeToJavaString(String text) {");
		sc.add("if (text == null) {");
		sc.add("return null;");
		sc.add("}");
		//for javac: replace one backslash by two and escape double quotes
		sc.add("return text.replaceAll(\"\\\\\\\\\", \"\\\\\\\\\\\\\\\\\")." +
			"replaceAll(\"\\\"\", \"\\\\\\\\\\\"\")." +
			"replace(\"\\b\", \"\\\\b\")." +
			"replace(\"\\f\", \"\\\\f\")." +
			"replace(\"\\n\", \"\\\\n\")." +
			"replace(\"\\r\", \"\\\\r\")." +
			"replace(\"\\t\", \"\\\\t\");");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addEscapeToANTLRKeywordMethod(JavaComposite sc) {
		sc.addJavadoc(
			"Escapes the given text such that it can be safely embedded in an " +
			"ANTLR grammar as keyword (i.e., an in-line token). Single quotes " +
			"are escaped using a backslash. Backslashes are escaped using a " +
			"backslash.",
			"@param text the text to escape",
			"@return the escaped text"
		);
		sc.add("public static String escapeToANTLRKeyword(String value) {");
		sc.add("return escapeToJavaString(value).replace(\"'\", \"\\\\'\").replace(\"%\", \"\\\\u0025\");");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addIsUnicodeSequenceMethod(JavaComposite sc) {
		sc.add("public static boolean isUnicodeSequence(String text) {");
		sc.add("return text.matches(UNICODE_SEQUENCE_REGEXP);");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addMatchCamelCaseMethod(StringComposite sc) {
		sc.add("public static String matchCamelCase(String query, String str) {");
		sc.add("if (!query.matches(\"[A-Za-z\\\\*]+\")) {");
		sc.add("return null;");
		sc.add("}");
		sc.add("String head = \"\";");
		sc.add("int i;");
		sc.add("for (i = 0; i < query.length(); i++) {");
		sc.add("char charI = query.charAt(i);");
		sc.add("if (Character.isLowerCase(charI)) {");
		sc.add("head += charI;");
		sc.add("} else {");
		sc.add("break;");
		sc.add("}");
		sc.add("}");
		sc.add("if (i > 0) {");
		sc.add("head += \"[^A-Z]*\";");
		sc.add("}");
		sc.add("String tail = query.substring(i);");
		sc.add("String re = \"\\\\b(\";");
		sc.add("tail = tail.replaceAll(\"\\\\*\", \".*?\");");
		sc.add("re += head + tail.replaceAll(\"([A-Z][^A-Z]*)\", \"$1[^A-Z]*\");");
		sc.add("re +=  \".*?)\\\\b\";");
		sc.add(PATTERN + " regex = " + PATTERN + ".compile(re);");
		sc.add(MATCHER + " m = regex.matcher(str);");
		sc.add("if (m.find()) {");
		sc.add("return m.group();");
		sc.add("} else {");
		sc.add("return null;");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
	}
}
