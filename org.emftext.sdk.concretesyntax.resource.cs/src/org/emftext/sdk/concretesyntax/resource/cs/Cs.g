grammar Cs;
options {
	superClass = AbstractEMFTextParser; 
	backtrack = true;
}
@lexer::header{
package org.emftext.sdk.concretesyntax.resource.cs;

}

@lexer::members{
	public java.util.List<org.antlr.runtime.RecognitionException> lexerExceptions  = new java.util.ArrayList<org.antlr.runtime.RecognitionException>();
	public java.util.List<java.lang.Integer> lexerExceptionsPosition       = new java.util.ArrayList<java.lang.Integer>();

	public void reportError(org.antlr.runtime.RecognitionException e) {
		lexerExceptions.add(e);

		lexerExceptionsPosition.add(((org.antlr.runtime.ANTLRStringStream)input).index());
	}
}
@header{
package org.emftext.sdk.concretesyntax.resource.cs;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.InternalEObject;
import org.eclipse.emf.common.util.URI;
import org.emftext.runtime.resource.impl.AbstractEMFTextParser;
}

@members{
	private org.emftext.runtime.resource.ITokenResolverFactory tokenResolverFactory = new CsTokenResolverFactory();
	private int lastPosition;

	protected EObject doParse() throws RecognitionException {
	lastPosition = 0;
		((CsLexer)getTokenStream().getTokenSource()).lexerExceptions = lexerExceptions;
		((CsLexer)getTokenStream().getTokenSource()).lexerExceptionsPosition = lexerExceptionsPosition;
		return start();
	}

	@SuppressWarnings("unchecked")
	private boolean addObjectToList(org.eclipse.emf.ecore.EObject element, java.lang.String featureName, java.lang.Object proxy) {
		return ((java.util.List<java.lang.Object>) element.eGet(element.eClass().getEStructuralFeature(featureName))).add(proxy);
	}

	protected void collectHiddenTokens(org.eclipse.emf.ecore.EObject element, Object o) throws org.emftext.runtime.resource.impl.TokenConversionException {
		int currentPos = getTokenStream().index();
		int endPos = currentPos - 1;
		for (; endPos >= lastPosition; endPos--) {
			org.antlr.runtime.Token token = getTokenStream().get(endPos);
			int _channel = token.getChannel();
			if (_channel != 99) {
				break;
			}
		}
		for (int pos = lastPosition; pos < endPos; pos++) {
			org.antlr.runtime.Token token = getTokenStream().get(pos);
			int _channel = token.getChannel();
			if (_channel == 99) {
			}
		}
		lastPosition = endPos;
	}
}

start
returns [ EObject element = null]
:  
	(
c0 = concretesyntax{ element = c0; }
	)
	EOF

;

concretesyntax returns [org.emftext.sdk.concretesyntax.ConcreteSyntax element = null]
@init{
}
:
	a0 = 'SYNTAXDEF'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a1.getText(),element.eClass().getEStructuralFeature("name"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a1,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("name"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a1, element); }
	a2 = 'FOR'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a2);copyLocalizationInfos((CommonToken)a2, element); }
	a3 = QUOTED_60_62{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a3.getText(),element.eClass().getEStructuralFeature("package"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a3,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenPackage proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenPackage();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("package"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("package"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a3, element); copyLocalizationInfos((CommonToken) a3, proxy); }
	a4 = 'START'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a4);copyLocalizationInfos((CommonToken)a4, element); }
	(
		a5 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a5.getText(),element.eClass().getEStructuralFeature("startSymbols"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a5,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("startSymbols"), resolved, proxy);addObjectToList(element, "startSymbols", proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a5, element); copyLocalizationInfos((CommonToken) a5, proxy); }
	)
	(
		(
			a6 = ','{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a6);copyLocalizationInfos((CommonToken)a6, element); }
			(
				a7 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a7.getText(),element.eClass().getEStructuralFeature("startSymbols"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a7,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("startSymbols"), resolved, proxy);addObjectToList(element, "startSymbols", proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a7, element); copyLocalizationInfos((CommonToken) a7, proxy); }
			)
		)
	)*
	(
		(
			a8 = 'IMPORTS'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a8);copyLocalizationInfos((CommonToken)a8, element); }
			a9 = '{'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a9);copyLocalizationInfos((CommonToken)a9, element); }
			(
				(
					a10 = keywordimport{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); addObjectToList(element, "imports", a10); collectHiddenTokens(element, a10);copyLocalizationInfos(a10, element); }
				)
			)*
			a11 = '}'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a11);copyLocalizationInfos((CommonToken)a11, element); }
		)
	)?
	(
		(
			a12 = 'OPTIONS'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a12);copyLocalizationInfos((CommonToken)a12, element); }
			a13 = '{'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a13);copyLocalizationInfos((CommonToken)a13, element); }
			(
				(
					a14 = option{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); addObjectToList(element, "options", a14); collectHiddenTokens(element, a14);copyLocalizationInfos(a14, element); }
					a15 = ';'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a15);copyLocalizationInfos((CommonToken)a15, element); }
				)
			)*
			a16 = '}'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a16);copyLocalizationInfos((CommonToken)a16, element); }
		)
	)?
	(
		(
			a17 = 'TOKENS'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a17);copyLocalizationInfos((CommonToken)a17, element); }
			a18 = '{'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a18);copyLocalizationInfos((CommonToken)a18, element); }
			(
				(
					a19 = tokendefinition{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); addObjectToList(element, "tokens", a19); collectHiddenTokens(element, a19);copyLocalizationInfos(a19, element); }
					a20 = ';'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a20);copyLocalizationInfos((CommonToken)a20, element); }
				)
			)*
			a21 = '}'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a21);copyLocalizationInfos((CommonToken)a21, element); }
		)
	)?
	a22 = 'RULES'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a22);copyLocalizationInfos((CommonToken)a22, element); }
	a23 = '{'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a23);copyLocalizationInfos((CommonToken)a23, element); }
	(
		(
			a24 = rule{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax(); addObjectToList(element, "rules", a24); collectHiddenTokens(element, a24);copyLocalizationInfos(a24, element); }
		)+
	)
	a25 = '}'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();} collectHiddenTokens(element, (CommonToken)a25);copyLocalizationInfos((CommonToken)a25, element); }
;

keywordimport returns [org.emftext.sdk.concretesyntax.Import element = null]
@init{
}
:
	a0 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("prefix"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("prefix"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a0, element); }
	a1 = ':'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
	a2 = QUOTED_60_62{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a2.getText(),element.eClass().getEStructuralFeature("package"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a2,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenPackage proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenPackage();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("package"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("package"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a2, element); copyLocalizationInfos((CommonToken) a2, proxy); }
	(
		(
			a3 = 'WITH'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();} collectHiddenTokens(element, (CommonToken)a3);copyLocalizationInfos((CommonToken)a3, element); }
			a4 = 'SYNTAX'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();} collectHiddenTokens(element, (CommonToken)a4);copyLocalizationInfos((CommonToken)a4, element); }
			a5 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a5.getText(),element.eClass().getEStructuralFeature("concreteSyntax"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a5,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.emftext.sdk.concretesyntax.ConcreteSyntax proxy = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("concreteSyntax"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("concreteSyntax"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a5, element); copyLocalizationInfos((CommonToken) a5, proxy); }
		)
	)?
;

option returns [org.emftext.sdk.concretesyntax.Option element = null]
@init{
}
:
	a0 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createOption(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("name"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("name"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a0, element); }
	a1 = '='{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createOption();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
	a2 = QUOTED_34_34{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createOption(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_34_34");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a2.getText(),element.eClass().getEStructuralFeature("value"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a2,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("value"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a2, element); }
;

rule returns [org.emftext.sdk.concretesyntax.Rule element = null]
@init{
}
:
	(
		a0 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("metaclass"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("metaclass"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("metaclass"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a0, element); copyLocalizationInfos((CommonToken) a0, proxy); }
	)
	a1 = '::='{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
	a2 = choice{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule(); element.eSet(element.eClass().getEStructuralFeature("definition"), a2); collectHiddenTokens(element, a2);copyLocalizationInfos(a2, element); }
	a3 = ';'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule();} collectHiddenTokens(element, (CommonToken)a3);copyLocalizationInfos((CommonToken)a3, element); }
;

sequence returns [org.emftext.sdk.concretesyntax.Sequence element = null]
@init{
}
:
	(
		a0 = definition{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createSequence(); addObjectToList(element, "parts", a0); collectHiddenTokens(element, a0);copyLocalizationInfos(a0, element); }
	)+
;

choice returns [org.emftext.sdk.concretesyntax.Choice element = null]
@init{
}
:
	a0 = sequence{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createChoice(); addObjectToList(element, "options", a0); collectHiddenTokens(element, a0);copyLocalizationInfos(a0, element); }
	(
		(
			a1 = '|'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createChoice();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
			a2 = sequence{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createChoice(); addObjectToList(element, "options", a2); collectHiddenTokens(element, a2);copyLocalizationInfos(a2, element); }
		)
	)*
;

csstring returns [org.emftext.sdk.concretesyntax.CsString element = null]
@init{
}
:
	a0 = QUOTED_34_34{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCsString(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_34_34");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("value"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("value"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a0, element); }
;

definedplaceholder returns [org.emftext.sdk.concretesyntax.DefinedPlaceholder element = null]
@init{
}
:
	a0 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("feature"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenFeature proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenFeature();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("feature"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("feature"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a0, element); copyLocalizationInfos((CommonToken) a0, proxy); }
	a1 = '['{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
	a2 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a2.getText(),element.eClass().getEStructuralFeature("token"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a2,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.emftext.sdk.concretesyntax.NormalToken proxy = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("token"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("token"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a2, element); copyLocalizationInfos((CommonToken) a2, proxy); }
	a3 = ']'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();} collectHiddenTokens(element, (CommonToken)a3);copyLocalizationInfos((CommonToken)a3, element); }
	(
		a4 = cardinality{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder(); element.eSet(element.eClass().getEStructuralFeature("cardinality"), a4); collectHiddenTokens(element, a4);copyLocalizationInfos(a4, element); }
	)?
;

derivedplaceholder returns [org.emftext.sdk.concretesyntax.DerivedPlaceholder element = null]
@init{
}
:
	a0 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("feature"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenFeature proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenFeature();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("feature"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("feature"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a0, element); copyLocalizationInfos((CommonToken) a0, proxy); }
	a1 = '['{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
	(
		(
			a2 = QUOTED_39_39{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a2.getText(),element.eClass().getEStructuralFeature("prefix"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a2,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("prefix"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a2, element); }
			(
				(
					a3 = ','{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();} collectHiddenTokens(element, (CommonToken)a3);copyLocalizationInfos((CommonToken)a3, element); }
					a4 = QUOTED_39_39{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a4.getText(),element.eClass().getEStructuralFeature("suffix"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a4,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("suffix"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a4, element); }
				)
			)?
		)
	)?
	a5 = ']'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();} collectHiddenTokens(element, (CommonToken)a5);copyLocalizationInfos((CommonToken)a5, element); }
	(
		a6 = cardinality{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder(); element.eSet(element.eClass().getEStructuralFeature("cardinality"), a6); collectHiddenTokens(element, a6);copyLocalizationInfos(a6, element); }
	)?
;

containment returns [org.emftext.sdk.concretesyntax.Containment element = null]
@init{
}
:
	a0 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a0.getText(),element.eClass().getEStructuralFeature("feature"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a0,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenFeature proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenFeature();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("feature"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("feature"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a0, element); copyLocalizationInfos((CommonToken) a0, proxy); }
	(
		(
			a1 = ':'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();} collectHiddenTokens(element, (CommonToken)a1);copyLocalizationInfos((CommonToken)a1, element); }
			a2 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a2.getText(),element.eClass().getEStructuralFeature("type"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a2,resolvedResolver.getErrorMessage());String resolved = (String) resolvedObject;org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();collectHiddenTokens(element, proxy); getResource().registerContextDependentProxy(element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature("type"), resolved, proxy);element.eSet(element.eClass().getEStructuralFeature("type"), proxy); collectHiddenTokens(element, proxy);copyLocalizationInfos((CommonToken) a2, element); copyLocalizationInfos((CommonToken) a2, proxy); }
		)
	)?
	(
		a3 = cardinality{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment(); element.eSet(element.eClass().getEStructuralFeature("cardinality"), a3); collectHiddenTokens(element, a3);copyLocalizationInfos(a3, element); }
	)?
;

compounddefinition returns [org.emftext.sdk.concretesyntax.CompoundDefinition element = null]
@init{
}
:
	a0 = '('{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = choice{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition(); element.eSet(element.eClass().getEStructuralFeature("definitions"), a1); collectHiddenTokens(element, a1);copyLocalizationInfos(a1, element); }
	a2 = ')'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition();} collectHiddenTokens(element, (CommonToken)a2);copyLocalizationInfos((CommonToken)a2, element); }
	(
		a3 = cardinality{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition(); element.eSet(element.eClass().getEStructuralFeature("cardinality"), a3); collectHiddenTokens(element, a3);copyLocalizationInfos(a3, element); }
	)?
;

plus returns [org.emftext.sdk.concretesyntax.PLUS element = null]
@init{
}
:
	a0 = '+'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPLUS();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
;

star returns [org.emftext.sdk.concretesyntax.STAR element = null]
@init{
}
:
	a0 = '*'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createSTAR();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
;

questionmark returns [org.emftext.sdk.concretesyntax.QUESTIONMARK element = null]
@init{
}
:
	a0 = '?'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createQUESTIONMARK();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
;

whitespaces returns [org.emftext.sdk.concretesyntax.WhiteSpaces element = null]
@init{
}
:
	a0 = '#'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createWhiteSpaces();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = NUMBER{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createWhiteSpaces(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("NUMBER");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a1.getText(),element.eClass().getEStructuralFeature("amount"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a1,resolvedResolver.getErrorMessage());java.lang.Integer resolved = (java.lang.Integer)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("amount"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a1, element); }
;

linebreak returns [org.emftext.sdk.concretesyntax.LineBreak element = null]
@init{
}
:
	a0 = '!'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createLineBreak();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = NUMBER{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createLineBreak(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("NUMBER");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a1.getText(),element.eClass().getEStructuralFeature("tab"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a1,resolvedResolver.getErrorMessage());java.lang.Integer resolved = (java.lang.Integer)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("tab"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a1, element); }
;

normaltoken returns [org.emftext.sdk.concretesyntax.NormalToken element = null]
@init{
}
:
	a0 = 'DEFINE'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a1.getText(),element.eClass().getEStructuralFeature("name"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a1,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("name"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a1, element); }
	a2 = QUOTED_36_36{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_36_36");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a2.getText(),element.eClass().getEStructuralFeature("regex"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a2,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("regex"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a2, element); }
	(
		(
			a3 = 'COLLECT'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();} collectHiddenTokens(element, (CommonToken)a3);copyLocalizationInfos((CommonToken)a3, element); }
			a4 = 'IN'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();} collectHiddenTokens(element, (CommonToken)a4);copyLocalizationInfos((CommonToken)a4, element); }
			a5 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a5.getText(),element.eClass().getEStructuralFeature("attributeName"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a5,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("attributeName"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a5, element); }
		)
	)?
;

decoratedtoken returns [org.emftext.sdk.concretesyntax.DecoratedToken element = null]
@init{
}
:
	a0 = 'DEFINE'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a1.getText(),element.eClass().getEStructuralFeature("name"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a1,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("name"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a1, element); }
	(
		a2 = '['{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a2);copyLocalizationInfos((CommonToken)a2, element); }
		(
			a3 = QUOTED_39_39{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a3.getText(),element.eClass().getEStructuralFeature("prefix"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a3,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("prefix"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a3, element); }
		)
		a4 = ']'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a4);copyLocalizationInfos((CommonToken)a4, element); }
	)
	a5 = QUOTED_36_36{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_36_36");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a5.getText(),element.eClass().getEStructuralFeature("regex"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a5,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("regex"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a5, element); }
	(
		a6 = '['{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a6);copyLocalizationInfos((CommonToken)a6, element); }
		(
			a7 = QUOTED_39_39{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a7.getText(),element.eClass().getEStructuralFeature("suffix"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a7,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("suffix"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a7, element); }
		)
		a8 = ']'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a8);copyLocalizationInfos((CommonToken)a8, element); }
	)
	(
		(
			a9 = 'COLLECT'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a9);copyLocalizationInfos((CommonToken)a9, element); }
			a10 = 'IN'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();} collectHiddenTokens(element, (CommonToken)a10);copyLocalizationInfos((CommonToken)a10, element); }
			a11 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a11.getText(),element.eClass().getEStructuralFeature("attributeName"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a11,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("attributeName"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a11, element); }
		)
	)?
;

predefinedtoken returns [org.emftext.sdk.concretesyntax.PreDefinedToken element = null]
@init{
}
:
	a0 = 'PREDEFINED'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();} collectHiddenTokens(element, (CommonToken)a0);copyLocalizationInfos((CommonToken)a0, element); }
	a1 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a1.getText(),element.eClass().getEStructuralFeature("name"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a1,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("name"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a1, element); }
	(
		(
			a2 = 'COLLECT'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();} collectHiddenTokens(element, (CommonToken)a2);copyLocalizationInfos((CommonToken)a2, element); }
			a3 = 'IN'{ if (element == null) {element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();} collectHiddenTokens(element, (CommonToken)a3);copyLocalizationInfos((CommonToken)a3, element); }
			a4 = QUALIFIED_NAME{if (element == null) element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken(); org.emftext.runtime.resource.ITokenResolver resolvedResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");resolvedResolver.setOptions(getOptions());Object resolvedObject =resolvedResolver.resolve(a4.getText(),element.eClass().getEStructuralFeature("attributeName"),element,getResource());if(resolvedObject==null) throw new org.emftext.runtime.resource.impl.TokenConversionException(a4,resolvedResolver.getErrorMessage());java.lang.String resolved = (java.lang.String)resolvedObject;element.eSet(element.eClass().getEStructuralFeature("attributeName"), resolved); collectHiddenTokens(element, resolved);copyLocalizationInfos((CommonToken) a4, element); }
		)
	)?
;

tokendefinition
returns [org.emftext.sdk.concretesyntax.TokenDefinition element = null]
:
	c0 = normaltoken{ element = c0; }	|
	c1 = decoratedtoken{ element = c1; }	|
	c2 = predefinedtoken{ element = c2; }
;

definition
returns [org.emftext.sdk.concretesyntax.Definition element = null]
:
	c0 = csstring{ element = c0; }	|
	c1 = definedplaceholder{ element = c1; }	|
	c2 = derivedplaceholder{ element = c2; }	|
	c3 = containment{ element = c3; }	|
	c4 = compounddefinition{ element = c4; }	|
	c5 = whitespaces{ element = c5; }	|
	c6 = linebreak{ element = c6; }
;

cardinality
returns [org.emftext.sdk.concretesyntax.Cardinality element = null]
:
	c0 = plus{ element = c0; }	|
	c1 = star{ element = c1; }	|
	c2 = questionmark{ element = c2; }
;

COMMENTS
:
	'//'(~('\n'|'\r'))*{ _channel = 99; }
;
QUALIFIED_NAME
:
	('A'..'Z'|'a'..'z'|'_')('A'..'Z'|'a'..'z'|'_'|'-'|'0'..'9')*('.'('A'..'Z'|'a'..'z'|'_'|'-'|'0'..'9')+)*
;
NUMBER
:
	('0'..'9')+
;
WHITESPACE
:
	(' '|'\t'|'\f'){ _channel = 99; }
;
LINEBREAK
:
	('\r\n'|'\r'|'\n'){ _channel = 99; }
;
QUOTED_60_62
:
	('<')(~('>')|('\\''>'))*('>')
;
QUOTED_39_39
:
	('\'')(~('\'')|('\\''\''))*('\'')
;
QUOTED_36_36
:
	('$')(~('$')|('\\''$'))*('$')
;
QUOTED_34_34
:
	('"')(~('"')|('\\''"'))*('"')
;
