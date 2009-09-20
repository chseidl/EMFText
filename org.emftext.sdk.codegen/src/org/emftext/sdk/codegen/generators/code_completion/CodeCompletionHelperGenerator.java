package org.emftext.sdk.codegen.generators.code_completion;

import static org.emftext.sdk.codegen.generators.IClassNameConstants.*;
import org.emftext.sdk.codegen.generators.BaseGenerator;
import org.emftext.sdk.codegen.GenerationContext;
import java.io.PrintWriter;
import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.IGenerator;

public class CodeCompletionHelperGenerator extends BaseGenerator {

	private String iExpectedElementClassName;
	private String eClassUtilClassName;
	private String iMetaInformationClassName;
	private String iTextParserClassName;
	private String iReferenceResolverSwitchClassName;
	private String iReferenceResolveResultClassName;
	private String iReferenceMappingClassName;
	private String iTokenResolverFactoryClassName;
	private String iTokenResolverClassName;
	private String stringUtilClassName;
	private String expectedCsStringClassName;
	private String expectedStructuralFeatureClassName;
	private String referenceResolveResultClassName;

	public CodeCompletionHelperGenerator() {
		super();
	}

	private CodeCompletionHelperGenerator(GenerationContext context) {
		super(context, EArtifact.CODE_COMPLETION_HELPER);
		iExpectedElementClassName = getContext().getQualifiedClassName(EArtifact.I_EXPECTED_ELEMENT);
		eClassUtilClassName = getContext().getQualifiedClassName(EArtifact.E_CLASS_UTIL);
		iMetaInformationClassName = getContext().getQualifiedClassName(EArtifact.META_INFORMATION);
		iTextParserClassName = getContext().getQualifiedClassName(EArtifact.I_TEXT_PARSER);
		iReferenceResolverSwitchClassName = getContext().getQualifiedClassName(EArtifact.I_REFERENCE_RESOLVER_SWITCH);
		iReferenceResolveResultClassName = getContext().getQualifiedClassName(EArtifact.I_REFERENCE_RESOLVE_RESULT);
		referenceResolveResultClassName = getContext().getQualifiedClassName(EArtifact.REFERENCE_RESOLVE_RESULT);
		iReferenceMappingClassName = getContext().getQualifiedClassName(EArtifact.I_REFERENCE_MAPPING);
		iTokenResolverFactoryClassName = getContext().getQualifiedClassName(EArtifact.I_TOKEN_RESOLVER_FACTORY);
		iTokenResolverClassName = getContext().getQualifiedClassName(EArtifact.I_TOKEN_RESOLVER);
		stringUtilClassName = getContext().getQualifiedClassName(EArtifact.STRING_UTIL);
		expectedCsStringClassName = getContext().getQualifiedClassName(EArtifact.EXPECTED_CS_STRING);
		expectedStructuralFeatureClassName = getContext().getQualifiedClassName(EArtifact.EXPECTED_STRUCTURAL_FEATURE);
	}

	public IGenerator newInstance(GenerationContext context) {
		return new CodeCompletionHelperGenerator(context);
	}

	public boolean generate(PrintWriter out) {
		org.emftext.sdk.codegen.composites.StringComposite sc = new org.emftext.sdk.codegen.composites.JavaComposite();
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		
		sc.add("// A CodeCompletionHelper can be used to derive completion proposals for partial");
		sc.add("// documents. It run the parser generated by EMFText in a special mode (i.e., the");
		sc.add("// rememberExpectedElements mode). Based on the elements that are expected by the");
		sc.add("// parser for different regions in the document, valid proposals are computed.");
	
		// TODO mseifert: calculate and consider the prefix and return only the proposals
		// that start with the prefix
		sc.add("public class " + getResourceClassName() + " {");
		sc.addLineBreak();
		sc.add("private final static " + eClassUtilClassName + " eClassUtil = new " + eClassUtilClassName + "();");
		sc.addLineBreak();
		
		sc.add("// Computes a set of proposals for the given document assuming the cursor is");
		sc.add("// at 'cursorOffset'. The proposals are derived using the meta information, i.e.,");
		sc.add("// the generated language plug-in.");
		sc.add("//");
		sc.add("// @param metaInformation");
		sc.add("// @param content the documents content");
		sc.add("// @param cursorOffset");
		sc.add("// @return");
		
		sc.add("public " + COLLECTION + "<String> computeCompletionProposals(" + iMetaInformationClassName + " metaInformation, String content, int cursorOffset) {");
		sc.add(BYTE_ARRAY_INPUT_STREAM + " inputStream = new " + BYTE_ARRAY_INPUT_STREAM + "(content.getBytes());");
		sc.add(iTextParserClassName + " parser = metaInformation.createParser(inputStream, null);");
		sc.add("final " + LIST + "<" + iExpectedElementClassName + "> expectedElements = parseToExpectedElements(parser);");
		sc.add("if (expectedElements == null) {");
		sc.add("return " + COLLECTIONS + ".emptyList();");
		sc.add("}");
		sc.add("if (expectedElements.size() == 0) {");
		sc.add("return " + COLLECTIONS + ".emptyList();");
		sc.add("}");
		sc.add(LIST + "<" + iExpectedElementClassName + "> expectedElementsAt = getExpectedElements(expectedElements, cursorOffset);");
		sc.add("setPrefix(expectedElementsAt, content, cursorOffset);");
		sc.add("// TODO this is done twice (was already calculated in getFinalExpectedElementAt())");
		sc.add("//IExpectedElement expectedAtCursor = getExpectedElementAt(offset, expectedElements);");
		sc.add("System.out.println(\" PARSER returned expectation: \" + expectedElementsAt + \" for offset \" + cursorOffset);");
		sc.add(COLLECTION + "<String> proposals = deriveProposals(expectedElementsAt, content, metaInformation, cursorOffset);");
		sc.addLineBreak();
		sc.add("final " + LIST + "<String> sortedProposals = new " + ARRAY_LIST + "<String>(proposals);");
		sc.add("" + COLLECTIONS + ".sort(sortedProposals);");
		sc.add("return sortedProposals;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public " + LIST + "<" + iExpectedElementClassName + "> parseToExpectedElements(" + iTextParserClassName + " parser) {");
		sc.add("final " + LIST + "<" + iExpectedElementClassName + "> expectedElements = parser.parseToExpectedElements(null);");
		sc.add("if (expectedElements == null) {");
		sc.add("return " + COLLECTIONS + ".emptyList();");
		sc.add("}");
		sc.add("removeDuplicateEntries(expectedElements);");
		sc.add("removeInvalidEntriesAtEnd(expectedElements);");
		sc.add("for (" + iExpectedElementClassName + " expectedElement : expectedElements) {");
		sc.add("System.out.println(\"PARSER EXPECTS:   \" + expectedElement);");
		sc.add("}");
		sc.add("return expectedElements;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private void removeDuplicateEntries(" + LIST + "<" + iExpectedElementClassName + "> expectedElements) {");
		sc.add("for (int i = 0; i < expectedElements.size() - 1; i++) {");
		sc.add("" + iExpectedElementClassName + " elementAtIndex = expectedElements.get(i);");
		sc.add("for (int j = i + 1; j < expectedElements.size();) {");
		sc.add("" + iExpectedElementClassName + " elementAtNext = expectedElements.get(j);");
		sc.add("if (elementAtIndex.equals(elementAtNext) &&");
		sc.add("elementAtIndex.getStartExcludingHiddenTokens() == elementAtNext.getStartExcludingHiddenTokens()) {");
		sc.add("expectedElements.remove(j);");
		sc.add("} else {");
		sc.add("j++;");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private void removeInvalidEntriesAtEnd(" + LIST + "<" + iExpectedElementClassName + "> expectedElements) {");
		sc.add("for (int i = 0; i < expectedElements.size() - 1;) {");
		sc.add("" + iExpectedElementClassName + " elementAtIndex = expectedElements.get(i);");
		sc.add("" + iExpectedElementClassName + " elementAtNext = expectedElements.get(i + 1);");
		sc.add("if (elementAtIndex.getStartExcludingHiddenTokens() == elementAtNext.getStartExcludingHiddenTokens() &&");
		sc.add("//elementAtIndex.discardFollowingExpectations() &&");
		sc.add("// TODO mseifert: this is wrong. we must compare the scopeIDs based on their parts!");
		sc.add("shouldRemove(elementAtIndex.getScopeID(), elementAtNext.getScopeID())) {");
		sc.add("expectedElements.remove(i + 1);");
		sc.add("} else {");
		sc.add("i++;");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private boolean shouldRemove(String scopeID1, String scopeID2) {");
		sc.add("String[] parts1 = scopeID1.split(\"\\\\.\");");
		sc.add("String[] parts2 = scopeID2.split(\"\\\\.\");");
		sc.add("for (int p1 = 0; p1 < parts1.length; p1++) {");
		sc.add("String segment1 = parts1[p1];");
		sc.add("if (p1 >= parts2.length) {");
		sc.add("return true;");
		sc.add("}");
		sc.add("String segment2 = parts2[p1];");
		sc.add("int compareTo = segment1.compareTo(segment2);");
		sc.add("if (compareTo == 0) {");
		sc.add("continue;");
		sc.add("}");
		sc.add("}");
		sc.add("return false;");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("private String findPrefix(" + LIST + "<" + iExpectedElementClassName + "> expectedElements, " + iExpectedElementClassName + " expectedAtCursor, String content, int cursorOffset) {");
		sc.add("if (cursorOffset < 0) {");
		sc.add("return \"\";");
		sc.add("}");
		sc.add("int end = 0;");
		sc.add("for (" + iExpectedElementClassName + " expectedElement : expectedElements) {");
		sc.add("if (expectedElement == expectedAtCursor) {");
		sc.add("final int start = expectedElement.getStartExcludingHiddenTokens();");
		sc.add("if (start >= 0  && start < Integer.MAX_VALUE) {");
		sc.add("end = start;");
		sc.add("}");
		sc.add("break;");
		sc.add("}");

		/*
		sc.add("// TODO fix calculation of 'end'");
		sc.add("final int endIncludingHiddenTokens = expectedElement.getEndIncludingHiddenTokens();");
		sc.add("if (endIncludingHiddenTokens >= 0 && endIncludingHiddenTokens < Integer.MAX_VALUE) {");
		sc.add("end = endIncludingHiddenTokens;");
		sc.add("}");
		*/
		
		/*
		sc.add("// TODO trim?");
		sc.add("//");
		sc.add("int endExcludingHidden = expectedElement.getEndExcludingHiddenTokens();");
		sc.add("if (endExcludingHidden >= 0) {");
		sc.add("end = endExcludingHidden;");
		sc.add("}");
		sc.add("if (end >= offset) {");
		sc.add("end = offset;");
		sc.add("break;");
		sc.add("}");
		*/
		
		sc.add("}");
		sc.add("end = Math.min(end, cursorOffset);");
		sc.add("//System.out.println(\"substring(\"+end+\",\"+offset+\")\");");
		sc.add("final String prefix = content.substring(end, Math.min(content.length(), cursorOffset + 1));");
		sc.add("System.out.println(\"Found prefix '\" + prefix + \"'\");");
		sc.add("return prefix;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> deriveProposals(");
		sc.add("" + LIST + "<" + iExpectedElementClassName + "> expectedElements, String content, " + iMetaInformationClassName + " metaInformation, int cursorOffset) {");
		sc.add("" + COLLECTION + "<String> resultSet = new " + HASH_SET + "<String>();");
		sc.add("for (" + iExpectedElementClassName + " expectedElement : expectedElements) {");
		sc.add("resultSet.addAll(deriveProposals(expectedElement, content, metaInformation, cursorOffset));");
		sc.add("}");
		sc.add("return resultSet;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> deriveProposals(");
		sc.add("" + iExpectedElementClassName + " expectedElement, String content, " + iMetaInformationClassName + " metaInformation, int cursorOffset) {");
		sc.add("if (expectedElement instanceof " + expectedCsStringClassName + ") {");
		sc.add(expectedCsStringClassName + " csString = (" + expectedCsStringClassName + ") expectedElement;");
		sc.add("return deriveProposal(csString, content, cursorOffset);");
		sc.add("} else if (expectedElement instanceof " + expectedStructuralFeatureClassName + ") {");
		sc.add(expectedStructuralFeatureClassName + " expectedFeature = (" + expectedStructuralFeatureClassName + ") expectedElement;");
		sc.add(E_STRUCTURAL_FEATURE + " feature = expectedFeature.getFeature();");
		sc.add(E_CLASSIFIER + " featureType = feature.getEType();");
		sc.add(E_OBJECT + " container = expectedFeature.getContainer();");
		sc.add("if (feature instanceof " + E_REFERENCE + ") {");
		sc.add(E_REFERENCE + " reference = (" + E_REFERENCE + ") feature;");
		sc.add("if (featureType instanceof " + E_CLASS + ") {");
		sc.add("if (reference.isContainment()) {");
		sc.add(E_CLASS + " classType = (" + E_CLASS + ") featureType;");
		sc.add("return deriveProposals(classType, metaInformation, content, cursorOffset);");
		sc.add("} else {");
		sc.add("return handleNCReference(content, metaInformation, cursorOffset, container);");
		sc.add("}");
		sc.add("}");
		sc.add("} else if (feature instanceof " + E_ATTRIBUTE + ") {");
		sc.add(E_ATTRIBUTE + " attribute = (" + E_ATTRIBUTE + ") feature;");
		sc.add("if (featureType instanceof " + E_ENUM + ") {");
		sc.add(E_ENUM + " enumType = (" + E_ENUM + ") featureType;");
		sc.add("return deriveProposals(expectedElement, enumType, content, cursorOffset);");
		sc.add("} else {");
		sc.add("// handle EAttributes (derive default value depending on");
		sc.add("// the type of the attribute, figure out token resolver, and");
		sc.add("// call deResolve())");
		sc.add("return handleAttribute(metaInformation, expectedFeature, container, attribute);");
		sc.add("}");
		sc.add("} else {");
		sc.add("// there should be no other subclass of EStructuralFeature");
		sc.add("assert false;");
		sc.add("}");
		sc.add("} else {");
		sc.add("// there should be no other class implementing IExpectedElement");
		sc.add("assert false;");
		sc.add("}");
		sc.add("return " + COLLECTIONS + ".emptyList();");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> handleNCReference(String content, " + iMetaInformationClassName + " metaInformation, int cursorOffset, " + E_OBJECT + " container) {");
		sc.add("// handle non-containment references");
		sc.add(iReferenceResolverSwitchClassName + " resolverSwitch = metaInformation.getReferenceResolverSwitch();");
		sc.add(iReferenceResolveResultClassName + "<" + E_OBJECT + "> result = new " + referenceResolveResultClassName + "<" + E_OBJECT + ">(true);");
		sc.add("resolverSwitch.resolveFuzzy(\"\", container, 0, result);");
		sc.add("" + COLLECTION + "<" + iReferenceMappingClassName + "<" + E_OBJECT + ">> mappings = result.getMappings();");
		sc.add("if (mappings != null) {");
		sc.add("" + COLLECTION + "<String> resultSet = new " + HASH_SET + "<String>();");
		sc.add("for (" + iReferenceMappingClassName + "<" + E_OBJECT + "> mapping : mappings) {");
		sc.add("final String identifier = mapping.getIdentifier();");
		sc.add("System.out.println(\"deriveProposals() \" + identifier);");
		sc.add("resultSet.add(identifier);");
		sc.add("}");
		sc.add("return resultSet;");
		sc.add("}");
		sc.add("return " + COLLECTIONS + ".emptyList();");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> handleAttribute(" + iMetaInformationClassName + " metaInformation, " + expectedStructuralFeatureClassName + " expectedFeature, " + E_OBJECT + " container,");
		sc.add(E_ATTRIBUTE + " attribute) {");
		sc.add(OBJECT + " defaultValue = getDefaultValue(attribute);");
		sc.add("if (defaultValue != null) {");
		sc.add(iTokenResolverFactoryClassName + " tokenResolverFactory = metaInformation.getTokenResolverFactory();");
		sc.add("String tokenName = expectedFeature.getTokenName();");
		sc.add("if (tokenName != null) {");
		sc.add(iTokenResolverClassName + " tokenResolver = tokenResolverFactory.createTokenResolver(tokenName);");
		sc.add("if (tokenResolver != null) {");
		sc.add("String defaultValueAsString = tokenResolver.deResolve(defaultValue, attribute, container);");
		sc.add("" + COLLECTION + "<String> resultSet = new " + HASH_SET + "<String>();");
		sc.add("resultSet.add(defaultValueAsString);");
		sc.add("return resultSet;");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("return " + COLLECTIONS + ".emptyList();");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + OBJECT + " getDefaultValue(" + E_ATTRIBUTE + " attribute) {");
		sc.add("String typeName = attribute.getEType().getName();");
		sc.add("if (\"EString\".equals(typeName)) {");
		sc.add("return \"some\" + " + stringUtilClassName + ".capitalize(attribute.getName());");
		sc.add("}");
		sc.add("// TODO mseifert: add more default values for other types");
		sc.add("System.out.println(\"CodeCompletionHelper.getDefaultValue() unknown type \" + typeName);");
		sc.add("return attribute.getDefaultValue();");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> deriveProposals(");
		sc.add("" + E_CLASS + " type,");
		sc.add("" + iMetaInformationClassName + " metaInformation,");
		sc.add("String content, int cursorOffset) {");
		sc.add("" + COLLECTION + "<String> allProposals = new " + HASH_SET + "<String>();");
		sc.add("// find all sub classes and call parseToExpectedElements() for each");
		sc.add("// of them");
		sc.add("" + E_CLASS + "[] availableClasses = metaInformation.getClassesWithSyntax();");
		sc.add("" + COLLECTION + "<" + E_CLASS + "> allSubClasses = eClassUtil.getSubClasses(type, availableClasses);");
		sc.add("for (" + E_CLASS + " subClass : allSubClasses) {");
		sc.add("" + iTextParserClassName + " parser = metaInformation.createParser(new " + BYTE_ARRAY_INPUT_STREAM + "(new byte[0]), null);");
		sc.add("final " + LIST + "<" + iExpectedElementClassName + "> expectedElements = parser.parseToExpectedElements(subClass);");
		sc.add("if (expectedElements == null) {");
		sc.add("continue;");
		sc.add("}");
		sc.add("if (expectedElements.size() == 0) {");
		sc.add("continue;");
		sc.add("}");
		sc.add("" + LIST + "<" + iExpectedElementClassName + "> expectedElementsAt = getExpectedElements(expectedElements, 0);");
		sc.add("setPrefix(expectedElementsAt, content, 0);");
		sc.add("System.out.println(\"computeCompletionProposals() \" + expectedElementsAt + \" for offset \" + cursorOffset);");
		sc.add("" + COLLECTION + "<String> proposals = deriveProposals(expectedElementsAt, content, metaInformation, cursorOffset);");
		sc.add("allProposals.addAll(proposals);");
		sc.add("}");
		sc.add("return allProposals;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> deriveProposals(" + iExpectedElementClassName + " expectedElement, " + E_ENUM + " enumType, String content, int cursorOffset) {");
		sc.add("" + COLLECTION + "<" + E_ENUM_LITERAL + "> enumLiterals = enumType.getELiterals();");
		sc.add("" + COLLECTION + "<String> result = new " + HASH_SET + "<String>();");
		sc.add("for (" + E_ENUM_LITERAL + " literal : enumLiterals) {");
		sc.add("String proposal = literal.getLiteral();");
		sc.add("if (proposal.startsWith(expectedElement.getPrefix())) {");
		sc.add("result.add(proposal);");
		sc.add("}");
		sc.add("}");
		sc.add("return result;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private " + COLLECTION + "<String> deriveProposal(" + expectedCsStringClassName + " csString, String content, int cursorOffset) {");
		sc.add("String proposal = csString.getValue();");
		sc.addLineBreak();
		sc.add("" + COLLECTION + "<String> result = new " + HASH_SET + "<String>(1);");
		sc.add("result.add(proposal);");
		sc.add("return result;");
		sc.add("}");
		sc.addLineBreak();
		
		sc.add("// Returns the element(s) that is most suitable at the given cursor");
		sc.add("// index based on the list of expected elements.");
		sc.add("//");
		sc.add("// @param cursorOffset");
		sc.add("// @param allExpectedElements");
		sc.add("// @return");
		
		sc.add("// TODO mseifert: figure out what other combinations of elements before");
		sc.add("// and after the cursor position exist and which action should be taken.");
		sc.add("// For example, when a StructuralFeature is expected right before the");
		sc.add("// cursor and a CsString right after, we should return both elements.");
		sc.add("public " + LIST + "<" + iExpectedElementClassName + "> getExpectedElements(final " + LIST + "<" + iExpectedElementClassName + "> allExpectedElements,");
		sc.add("int cursorOffset) {");
		sc.addLineBreak();
		sc.add("" + LIST + "<" + iExpectedElementClassName + "> expectedAfterCursor = getElementsExpectedAt(allExpectedElements, cursorOffset);");
		sc.add("" + LIST + "<" + iExpectedElementClassName + "> expectedBeforeCursor = getElementsExpectedAt(allExpectedElements, cursorOffset - 1);");
		sc.add("System.out.println(\"parseToCursor(\" + cursorOffset + \") BEFORE CURSOR \" + expectedBeforeCursor);");
		sc.add("System.out.println(\"parseToCursor(\" + cursorOffset + \") AFTER CURSOR  \" + expectedAfterCursor);");
		sc.add("" + LIST + "<" + iExpectedElementClassName + "> allExpectedAtCursor = new " + ARRAY_LIST + "<" + iExpectedElementClassName + ">();");
		sc.add("allExpectedAtCursor.addAll(expectedAfterCursor);");
		sc.add("if (expectedBeforeCursor != null) {");
		sc.add("for (" + iExpectedElementClassName + " expectedBefore : expectedBeforeCursor) {");
		sc.add("// if the thing right before the cursor is something that could");
		sc.add("// be long we add it to the list of proposals");
		sc.add("if (expectedBefore instanceof " + expectedStructuralFeatureClassName + ") {");
		sc.add("//allExpectedAtCursor.clear();");
		sc.add("allExpectedAtCursor.add(expectedBefore);");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("return allExpectedAtCursor;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private void setPrefix(" + LIST + "<" + iExpectedElementClassName + "> allExpectedElements, String content, int cursorOffset) {");
		sc.add("if (cursorOffset < 0) {");
		sc.add("return;");
		sc.add("}");
		sc.add("for (" + iExpectedElementClassName + " expectedElementAtCursor : allExpectedElements) {");
		sc.add("expectedElementAtCursor.setPrefix(findPrefix(allExpectedElements, expectedElementAtCursor, content, cursorOffset));");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
		sc.add("public " + LIST + "<" + iExpectedElementClassName + "> getElementsExpectedAt(" + LIST + "<" + iExpectedElementClassName + "> allExpectedElements, int cursorOffset) {");
		sc.add("" + LIST + "<" + iExpectedElementClassName + "> expectedAtCursor = new " + ARRAY_LIST + "<" + iExpectedElementClassName + ">();");
		sc.add("for (int i = 0; i < allExpectedElements.size(); i++) {");
		sc.add("" + iExpectedElementClassName + " expectedElement = allExpectedElements.get(i);");
		sc.addLineBreak();
		sc.add("int startIncludingHidden = expectedElement.getStartIncludingHiddenTokens();");
		sc.add("//int startExcludingHidden = expectedElement.getStartExcludingHiddenTokens();");
		sc.add("int end = getEnd(allExpectedElements, i);");
		sc.add("//System.out.println(\"END = \" + end + \" for \" + expectedElement);");
		sc.add("if (cursorOffset >= startIncludingHidden &&");
		sc.add("cursorOffset <= end) {");
		sc.add("expectedAtCursor.add(expectedElement);");
		sc.add("}");
		sc.add("}");
		sc.add("return expectedAtCursor;");
		sc.add("}");
		sc.addLineBreak();
		sc.add("private int getEnd(" + LIST + "<" + iExpectedElementClassName + "> allExpectedElements, int indexInList) {");
		sc.add("" + iExpectedElementClassName + " elementAtIndex = allExpectedElements.get(indexInList);");
		sc.add("int startIncludingHidden = elementAtIndex.getStartIncludingHiddenTokens();");
		sc.add("int startExcludingHidden = elementAtIndex.getStartExcludingHiddenTokens();");
		sc.addLineBreak();
		sc.add("for (int i = indexInList + 1; i < allExpectedElements.size(); i++) {");
		sc.add("" + iExpectedElementClassName + " elementAtI = allExpectedElements.get(i);");
		sc.add("int startIncludingHiddenForI = elementAtI.getStartIncludingHiddenTokens();");
		sc.add("int startExcludingHiddenForI = elementAtI.getStartExcludingHiddenTokens();");
		sc.add("if (startIncludingHidden != startIncludingHiddenForI || startExcludingHidden != startExcludingHiddenForI) {");
		sc.add("return startIncludingHiddenForI - 1;");
		sc.add("}");
		sc.add("}");
		sc.add("return Integer.MAX_VALUE;");
		sc.add("}");
		sc.add("}");
		out.print(sc.toString());
		return true;
	}
}