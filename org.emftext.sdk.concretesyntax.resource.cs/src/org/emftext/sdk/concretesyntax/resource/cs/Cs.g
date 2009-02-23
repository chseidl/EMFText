grammar Cs;

options {
	superClass = AbstractEMFTextParser;
	backtrack = true;
	memoize = true;
}

@lexer::header {
	package org.emftext.sdk.concretesyntax.resource.cs;
}

@lexer::members {
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
	private org.emftext.runtime.resource.impl.TokenResolveResult tokenResolveResult = new org.emftext.runtime.resource.impl.TokenResolveResult();
	
	protected EObject doParse() throws RecognitionException {
		lastPosition = 0;
		((CsLexer)getTokenStream().getTokenSource()).lexerExceptions = lexerExceptions;
		((CsLexer)getTokenStream().getTokenSource()).lexerExceptionsPosition = lexerExceptionsPosition;
		return start();
	}
	
	@SuppressWarnings("unchecked")
	private boolean addObjectToList(org.eclipse.emf.ecore.EObject element, int featureID, java.lang.Object proxy) {
		return ((java.util.List<java.lang.Object>) element.eGet(element.eClass().getEStructuralFeature(featureID))).add(proxy);
	}
	
	private org.emftext.runtime.resource.impl.TokenResolveResult getFreshTokenResolveResult() {
		tokenResolveResult.clear();
		return tokenResolveResult;
	}
	
	protected void collectHiddenTokens(org.eclipse.emf.ecore.EObject element) {
	}
}

start returns [ EObject element = null]
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
	(
		(
			a0_0 = keywordabstract			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				if (a0_0 != null) {
					element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__MODIFIER), a0_0);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos(a0_0, element); 			}
		)
		
	)?	
	a1 = 'SYNTAXDEF' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a1, element);
	}
	
	(
		a2 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__NAME), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__NAME), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a2, element);
		}
	)
	
	a3 = 'FOR' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a3, element);
	}
	
	(
		a4 = QUOTED_60_62		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a4.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__PACKAGE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a4).getLine(), ((CommonToken) a4).getCharPositionInLine(), ((CommonToken) a4).getStartIndex(), ((CommonToken) a4).getStopIndex());
			}
			String resolved = (String) resolvedObject;
			org.eclipse.emf.codegen.ecore.genmodel.GenPackage proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenPackage();
			collectHiddenTokens(element);
			getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.GenPackageDependentElement, org.eclipse.emf.codegen.ecore.genmodel.GenPackage>(CsReferenceResolverSwitch.getGenPackageDependentElementPackageReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__PACKAGE), resolved, proxy);
			if (proxy != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__PACKAGE), proxy);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a4, element);
			copyLocalizationInfos((CommonToken) a4, proxy);
		}
	)
	
	(
		(
			(
				a5 = QUOTED_60_62				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a5.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__PACKAGE_LOCATION_HINT), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a5).getLine(), ((CommonToken) a5).getCharPositionInLine(), ((CommonToken) a5).getStartIndex(), ((CommonToken) a5).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__PACKAGE_LOCATION_HINT), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a5, element);
				}
			)
			
		)
		
	)?	
	(
		(
			a6 = 'START' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a6, element);
			}
			
			(
				(
					a7 = QUALIFIED_NAME					
					{
						if (element == null) {
							element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
						}
						org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
						tokenResolver.setOptions(getOptions());
						org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
						tokenResolver.resolve(a7.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__START_SYMBOLS), result);
						Object resolvedObject = result.getResolvedToken();
						if (resolvedObject == null) {
							getResource().addError(result.getErrorMessage(), ((CommonToken) a7).getLine(), ((CommonToken) a7).getCharPositionInLine(), ((CommonToken) a7).getStartIndex(), ((CommonToken) a7).getStopIndex());
						}
						String resolved = (String) resolvedObject;
						org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();
						collectHiddenTokens(element);
						getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.ConcreteSyntax, org.eclipse.emf.codegen.ecore.genmodel.GenClass>(CsReferenceResolverSwitch.getConcreteSyntaxStartSymbolsReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__START_SYMBOLS), resolved, proxy);
						if (proxy != null) {
							addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__START_SYMBOLS, proxy);
						}
						collectHiddenTokens(element);
						copyLocalizationInfos((CommonToken) a7, element);
						copyLocalizationInfos((CommonToken) a7, proxy);
					}
				)
				
			)
			
			(
				(
					a8 = ',' {
						if (element == null) {
							element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
						}
						collectHiddenTokens(element);
						copyLocalizationInfos((CommonToken)a8, element);
					}
					
					(
						(
							a9 = QUALIFIED_NAME							
							{
								if (element == null) {
									element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
								}
								org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
								tokenResolver.setOptions(getOptions());
								org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
								tokenResolver.resolve(a9.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__START_SYMBOLS), result);
								Object resolvedObject = result.getResolvedToken();
								if (resolvedObject == null) {
									getResource().addError(result.getErrorMessage(), ((CommonToken) a9).getLine(), ((CommonToken) a9).getCharPositionInLine(), ((CommonToken) a9).getStartIndex(), ((CommonToken) a9).getStopIndex());
								}
								String resolved = (String) resolvedObject;
								org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();
								collectHiddenTokens(element);
								getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.ConcreteSyntax, org.eclipse.emf.codegen.ecore.genmodel.GenClass>(CsReferenceResolverSwitch.getConcreteSyntaxStartSymbolsReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__START_SYMBOLS), resolved, proxy);
								if (proxy != null) {
									addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__START_SYMBOLS, proxy);
								}
								collectHiddenTokens(element);
								copyLocalizationInfos((CommonToken) a9, element);
								copyLocalizationInfos((CommonToken) a9, proxy);
							}
						)
						
					)
					
				)
				
			)*			
		)
		
	)?	
	(
		(
			a10 = 'IMPORTS' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a10, element);
			}
			
			a11 = '{' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a11, element);
			}
			
			(
				(
					(
						a12_0 = keywordimport						{
							if (element == null) {
								element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
							}
							if (a12_0 != null) {
								addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__IMPORTS, a12_0);
							}
							collectHiddenTokens(element);
							copyLocalizationInfos(a12_0, element); 						}
					)
					
				)
				
			)*			
			a13 = '}' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a13, element);
			}
			
		)
		
	)?	
	(
		(
			a14 = 'OPTIONS' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a14, element);
			}
			
			a15 = '{' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a15, element);
			}
			
			(
				(
					(
						a16_0 = option						{
							if (element == null) {
								element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
							}
							if (a16_0 != null) {
								addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__OPTIONS, a16_0);
							}
							collectHiddenTokens(element);
							copyLocalizationInfos(a16_0, element); 						}
					)
					
					a17 = ';' {
						if (element == null) {
							element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
						}
						collectHiddenTokens(element);
						copyLocalizationInfos((CommonToken)a17, element);
					}
					
				)
				
			)*			
			a18 = '}' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a18, element);
			}
			
		)
		
	)?	
	(
		(
			a19 = 'TOKENS' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a19, element);
			}
			
			a20 = '{' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a20, element);
			}
			
			(
				(
					(
						a21_0 = tokendefinition						{
							if (element == null) {
								element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
							}
							if (a21_0 != null) {
								addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__TOKENS, a21_0);
							}
							collectHiddenTokens(element);
							copyLocalizationInfos(a21_0, element); 						}
					)
					
					a22 = ';' {
						if (element == null) {
							element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
						}
						collectHiddenTokens(element);
						copyLocalizationInfos((CommonToken)a22, element);
					}
					
				)
				
			)*			
			a23 = '}' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a23, element);
			}
			
		)
		
	)?	
	a24 = 'RULES' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a24, element);
	}
	
	a25 = '{' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a25, element);
	}
	
	(
		(
			(
				a26_0 = rule				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
					}
					if (a26_0 != null) {
						addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONCRETE_SYNTAX__RULES, a26_0);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos(a26_0, element); 				}
			)
			
		)+		
	)
	
	a27 = '}' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a27, element);
	}
	
;

keywordimport returns [org.emftext.sdk.concretesyntax.Import element = null]
@init{
}
:
	(
		a0 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PREFIX), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PREFIX), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a0, element);
		}
	)
	
	a1 = ':' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a1, element);
	}
	
	(
		a2 = QUOTED_60_62		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PACKAGE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
			}
			String resolved = (String) resolvedObject;
			org.eclipse.emf.codegen.ecore.genmodel.GenPackage proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenPackage();
			collectHiddenTokens(element);
			getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.GenPackageDependentElement, org.eclipse.emf.codegen.ecore.genmodel.GenPackage>(CsReferenceResolverSwitch.getGenPackageDependentElementPackageReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PACKAGE), resolved, proxy);
			if (proxy != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PACKAGE), proxy);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a2, element);
			copyLocalizationInfos((CommonToken) a2, proxy);
		}
	)
	
	(
		(
			(
				a3 = QUOTED_60_62				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a3.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PACKAGE_LOCATION_HINT), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a3).getLine(), ((CommonToken) a3).getCharPositionInLine(), ((CommonToken) a3).getStartIndex(), ((CommonToken) a3).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__PACKAGE_LOCATION_HINT), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a3, element);
				}
			)
			
		)
		
	)?	
	(
		(
			a4 = 'WITH' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a4, element);
			}
			
			a5 = 'SYNTAX' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a5, element);
			}
			
			(
				a6 = QUALIFIED_NAME				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a6.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__CONCRETE_SYNTAX), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a6).getLine(), ((CommonToken) a6).getCharPositionInLine(), ((CommonToken) a6).getStartIndex(), ((CommonToken) a6).getStopIndex());
					}
					String resolved = (String) resolvedObject;
					org.emftext.sdk.concretesyntax.ConcreteSyntax proxy = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createConcreteSyntax();
					collectHiddenTokens(element);
					getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Import, org.emftext.sdk.concretesyntax.ConcreteSyntax>(CsReferenceResolverSwitch.getImportConcreteSyntaxReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__CONCRETE_SYNTAX), resolved, proxy);
					if (proxy != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__CONCRETE_SYNTAX), proxy);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a6, element);
					copyLocalizationInfos((CommonToken) a6, proxy);
				}
			)
			
			(
				(
					(
						a7 = QUOTED_60_62						
						{
							if (element == null) {
								element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createImport();
							}
							org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_60_62");
							tokenResolver.setOptions(getOptions());
							org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
							tokenResolver.resolve(a7.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__CS_LOCATION_HINT), result);
							Object resolvedObject = result.getResolvedToken();
							if (resolvedObject == null) {
								getResource().addError(result.getErrorMessage(), ((CommonToken) a7).getLine(), ((CommonToken) a7).getCharPositionInLine(), ((CommonToken) a7).getStartIndex(), ((CommonToken) a7).getStopIndex());
							}
							java.lang.String resolved = (java.lang.String)resolvedObject;
							if (resolved != null) {
								element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.IMPORT__CS_LOCATION_HINT), resolved);
							}
							collectHiddenTokens(element);
							copyLocalizationInfos((CommonToken) a7, element);
						}
					)
					
				)
				
			)?			
		)
		
	)?	
;

option returns [org.emftext.sdk.concretesyntax.Option element = null]
@init{
}
:
	(
		a0 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createOption();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.OPTION__NAME), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.OPTION__NAME), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a0, element);
		}
	)
	
	a1 = '=' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createOption();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a1, element);
	}
	
	(
		a2 = QUOTED_34_34		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createOption();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_34_34");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.OPTION__VALUE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.OPTION__VALUE), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a2, element);
		}
	)
	
;

rule returns [org.emftext.sdk.concretesyntax.Rule element = null]
@init{
}
:
	(
		(
			a0 = QUALIFIED_NAME			
			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule();
				}
				org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
				tokenResolver.setOptions(getOptions());
				org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
				tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.RULE__METACLASS), result);
				Object resolvedObject = result.getResolvedToken();
				if (resolvedObject == null) {
					getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
				}
				String resolved = (String) resolvedObject;
				org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();
				collectHiddenTokens(element);
				getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Rule, org.eclipse.emf.codegen.ecore.genmodel.GenClass>(CsReferenceResolverSwitch.getRuleMetaclassReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.RULE__METACLASS), resolved, proxy);
				if (proxy != null) {
					element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.RULE__METACLASS), proxy);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken) a0, element);
				copyLocalizationInfos((CommonToken) a0, proxy);
			}
		)
		
	)
	
	a1 = '::=' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a1, element);
	}
	
	(
		a2_0 = choice		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule();
			}
			if (a2_0 != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.RULE__DEFINITION), a2_0);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos(a2_0, element); 		}
	)
	
	a3 = ';' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createRule();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a3, element);
	}
	
;

sequence returns [org.emftext.sdk.concretesyntax.Sequence element = null]
@init{
}
:
	(
		(
			a0_0 = definition			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createSequence();
				}
				if (a0_0 != null) {
					addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.SEQUENCE__PARTS, a0_0);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos(a0_0, element); 			}
		)
		
	)+	
;

choice returns [org.emftext.sdk.concretesyntax.Choice element = null]
@init{
}
:
	(
		a0_0 = sequence		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createChoice();
			}
			if (a0_0 != null) {
				addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CHOICE__OPTIONS, a0_0);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos(a0_0, element); 		}
	)
	
	(
		(
			a1 = '|' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createChoice();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a1, element);
			}
			
			(
				a2_0 = sequence				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createChoice();
					}
					if (a2_0 != null) {
						addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CHOICE__OPTIONS, a2_0);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos(a2_0, element); 				}
			)
			
		)
		
	)*	
;

csstring returns [org.emftext.sdk.concretesyntax.CsString element = null]
@init{
}
:
	(
		a0 = QUOTED_34_34		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCsString();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_34_34");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CS_STRING__VALUE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CS_STRING__VALUE), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a0, element);
		}
	)
	
;

definedplaceholder returns [org.emftext.sdk.concretesyntax.DefinedPlaceholder element = null]
@init{
}
:
	(
		a0 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__FEATURE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
			}
			String resolved = (String) resolvedObject;
			org.eclipse.emf.codegen.ecore.genmodel.GenFeature proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenFeature();
			collectHiddenTokens(element);
			getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Terminal, org.eclipse.emf.codegen.ecore.genmodel.GenFeature>(CsReferenceResolverSwitch.getTerminalFeatureReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__FEATURE), resolved, proxy);
			if (proxy != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__FEATURE), proxy);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a0, element);
			copyLocalizationInfos((CommonToken) a0, proxy);
		}
	)
	
	a1 = '[' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a1, element);
	}
	
	(
		a2 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__TOKEN), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
			}
			String resolved = (String) resolvedObject;
			org.emftext.sdk.concretesyntax.PreDefinedToken proxy = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();
			collectHiddenTokens(element);
			getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.DefinedPlaceholder, org.emftext.sdk.concretesyntax.TokenDefinition>(CsReferenceResolverSwitch.getDefinedPlaceholderTokenReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__TOKEN), resolved, proxy);
			if (proxy != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__TOKEN), proxy);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a2, element);
			copyLocalizationInfos((CommonToken) a2, proxy);
		}
	)
	
	a3 = ']' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a3, element);
	}
	
	(
		(
			a4_0 = cardinality			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDefinedPlaceholder();
				}
				if (a4_0 != null) {
					element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DEFINED_PLACEHOLDER__CARDINALITY), a4_0);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos(a4_0, element); 			}
		)
		
	)?	
;

derivedplaceholder returns [org.emftext.sdk.concretesyntax.DerivedPlaceholder element = null]
@init{
}
:
	(
		a0 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__FEATURE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
			}
			String resolved = (String) resolvedObject;
			org.eclipse.emf.codegen.ecore.genmodel.GenFeature proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenFeature();
			collectHiddenTokens(element);
			getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Terminal, org.eclipse.emf.codegen.ecore.genmodel.GenFeature>(CsReferenceResolverSwitch.getTerminalFeatureReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__FEATURE), resolved, proxy);
			if (proxy != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__FEATURE), proxy);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a0, element);
			copyLocalizationInfos((CommonToken) a0, proxy);
		}
	)
	
	a1 = '[' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a1, element);
	}
	
	(
		(
			(
				a2 = QUOTED_39_39				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__PREFIX), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__PREFIX), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a2, element);
				}
			)
			
			(
				(
					a3 = ',' {
						if (element == null) {
							element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
						}
						collectHiddenTokens(element);
						copyLocalizationInfos((CommonToken)a3, element);
					}
					
					(
						a4 = QUOTED_39_39						
						{
							if (element == null) {
								element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
							}
							org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");
							tokenResolver.setOptions(getOptions());
							org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
							tokenResolver.resolve(a4.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__SUFFIX), result);
							Object resolvedObject = result.getResolvedToken();
							if (resolvedObject == null) {
								getResource().addError(result.getErrorMessage(), ((CommonToken) a4).getLine(), ((CommonToken) a4).getCharPositionInLine(), ((CommonToken) a4).getStartIndex(), ((CommonToken) a4).getStopIndex());
							}
							java.lang.String resolved = (java.lang.String)resolvedObject;
							if (resolved != null) {
								element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__SUFFIX), resolved);
							}
							collectHiddenTokens(element);
							copyLocalizationInfos((CommonToken) a4, element);
						}
					)
					
				)
				
			)?			
		)
		
	)?	
	a5 = ']' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a5, element);
	}
	
	(
		(
			a6_0 = cardinality			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDerivedPlaceholder();
				}
				if (a6_0 != null) {
					element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DERIVED_PLACEHOLDER__CARDINALITY), a6_0);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos(a6_0, element); 			}
		)
		
	)?	
;

containment returns [org.emftext.sdk.concretesyntax.Containment element = null]
@init{
}
:
	(
		a0 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a0.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__FEATURE), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a0).getLine(), ((CommonToken) a0).getCharPositionInLine(), ((CommonToken) a0).getStartIndex(), ((CommonToken) a0).getStopIndex());
			}
			String resolved = (String) resolvedObject;
			org.eclipse.emf.codegen.ecore.genmodel.GenFeature proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenFeature();
			collectHiddenTokens(element);
			getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Terminal, org.eclipse.emf.codegen.ecore.genmodel.GenFeature>(CsReferenceResolverSwitch.getTerminalFeatureReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__FEATURE), resolved, proxy);
			if (proxy != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__FEATURE), proxy);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a0, element);
			copyLocalizationInfos((CommonToken) a0, proxy);
		}
	)
	
	(
		(
			a1 = ':' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a1, element);
			}
			
			(
				a2 = QUALIFIED_NAME				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__TYPES), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
					}
					String resolved = (String) resolvedObject;
					org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();
					collectHiddenTokens(element);
					getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Containment, org.eclipse.emf.codegen.ecore.genmodel.GenClass>(CsReferenceResolverSwitch.getContainmentTypesReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__TYPES), resolved, proxy);
					if (proxy != null) {
						addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__TYPES, proxy);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a2, element);
					copyLocalizationInfos((CommonToken) a2, proxy);
				}
			)
			
			(
				(
					a3 = ',' {
						if (element == null) {
							element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();
						}
						collectHiddenTokens(element);
						copyLocalizationInfos((CommonToken)a3, element);
					}
					
					(
						a4 = QUALIFIED_NAME						
						{
							if (element == null) {
								element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();
							}
							org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
							tokenResolver.setOptions(getOptions());
							org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
							tokenResolver.resolve(a4.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__TYPES), result);
							Object resolvedObject = result.getResolvedToken();
							if (resolvedObject == null) {
								getResource().addError(result.getErrorMessage(), ((CommonToken) a4).getLine(), ((CommonToken) a4).getCharPositionInLine(), ((CommonToken) a4).getStartIndex(), ((CommonToken) a4).getStopIndex());
							}
							String resolved = (String) resolvedObject;
							org.eclipse.emf.codegen.ecore.genmodel.GenClass proxy = org.eclipse.emf.codegen.ecore.genmodel.impl.GenModelFactoryImpl.eINSTANCE.createGenClass();
							collectHiddenTokens(element);
							getResource().registerContextDependentProxy(new org.emftext.runtime.resource.impl.ContextDependentURIFragmentFactory<org.emftext.sdk.concretesyntax.Containment, org.eclipse.emf.codegen.ecore.genmodel.GenClass>(CsReferenceResolverSwitch.getContainmentTypesReferenceResolver()), element, (org.eclipse.emf.ecore.EReference) element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__TYPES), resolved, proxy);
							if (proxy != null) {
								addObjectToList(element, org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__TYPES, proxy);
							}
							collectHiddenTokens(element);
							copyLocalizationInfos((CommonToken) a4, element);
							copyLocalizationInfos((CommonToken) a4, proxy);
						}
					)
					
				)
				
			)*			
		)
		
	)?	
	(
		(
			a5_0 = cardinality			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createContainment();
				}
				if (a5_0 != null) {
					element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.CONTAINMENT__CARDINALITY), a5_0);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos(a5_0, element); 			}
		)
		
	)?	
;

compounddefinition returns [org.emftext.sdk.concretesyntax.CompoundDefinition element = null]
@init{
}
:
	a0 = '(' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
	(
		a1_0 = choice		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition();
			}
			if (a1_0 != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.COMPOUND_DEFINITION__DEFINITIONS), a1_0);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos(a1_0, element); 		}
	)
	
	a2 = ')' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a2, element);
	}
	
	(
		(
			a3_0 = cardinality			{
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createCompoundDefinition();
				}
				if (a3_0 != null) {
					element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.COMPOUND_DEFINITION__CARDINALITY), a3_0);
				}
				collectHiddenTokens(element);
				copyLocalizationInfos(a3_0, element); 			}
		)
		
	)?	
;

plus returns [org.emftext.sdk.concretesyntax.PLUS element = null]
@init{
}
:
	a0 = '+' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPLUS();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
;

star returns [org.emftext.sdk.concretesyntax.STAR element = null]
@init{
}
:
	a0 = '*' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createSTAR();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
;

questionmark returns [org.emftext.sdk.concretesyntax.QUESTIONMARK element = null]
@init{
}
:
	a0 = '?' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createQUESTIONMARK();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
;

whitespaces returns [org.emftext.sdk.concretesyntax.WhiteSpaces element = null]
@init{
}
:
	a0 = '#' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createWhiteSpaces();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
	(
		a1 = NUMBER		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createWhiteSpaces();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("NUMBER");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a1.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.WHITE_SPACES__AMOUNT), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a1).getLine(), ((CommonToken) a1).getCharPositionInLine(), ((CommonToken) a1).getStartIndex(), ((CommonToken) a1).getStopIndex());
			}
			java.lang.Integer resolved = (java.lang.Integer)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.WHITE_SPACES__AMOUNT), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a1, element);
		}
	)
	
;

linebreak returns [org.emftext.sdk.concretesyntax.LineBreak element = null]
@init{
}
:
	a0 = '!' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createLineBreak();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
	(
		a1 = NUMBER		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createLineBreak();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("NUMBER");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a1.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.LINE_BREAK__TAB), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a1).getLine(), ((CommonToken) a1).getCharPositionInLine(), ((CommonToken) a1).getStartIndex(), ((CommonToken) a1).getStopIndex());
			}
			java.lang.Integer resolved = (java.lang.Integer)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.LINE_BREAK__TAB), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a1, element);
		}
	)
	
;

normaltoken returns [org.emftext.sdk.concretesyntax.NormalToken element = null]
@init{
}
:
	a0 = 'DEFINE' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
	(
		a1 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a1.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.NORMAL_TOKEN__NAME), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a1).getLine(), ((CommonToken) a1).getCharPositionInLine(), ((CommonToken) a1).getStartIndex(), ((CommonToken) a1).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.NORMAL_TOKEN__NAME), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a1, element);
		}
	)
	
	(
		a2 = QUOTED_36_36		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_36_36");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a2.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.NORMAL_TOKEN__REGEX), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a2).getLine(), ((CommonToken) a2).getCharPositionInLine(), ((CommonToken) a2).getStartIndex(), ((CommonToken) a2).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.NORMAL_TOKEN__REGEX), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a2, element);
		}
	)
	
	(
		(
			a3 = 'COLLECT' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a3, element);
			}
			
			a4 = 'IN' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a4, element);
			}
			
			(
				a5 = QUALIFIED_NAME				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createNormalToken();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a5.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.NORMAL_TOKEN__ATTRIBUTE_NAME), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a5).getLine(), ((CommonToken) a5).getCharPositionInLine(), ((CommonToken) a5).getStartIndex(), ((CommonToken) a5).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.NORMAL_TOKEN__ATTRIBUTE_NAME), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a5, element);
				}
			)
			
		)
		
	)?	
;

decoratedtoken returns [org.emftext.sdk.concretesyntax.DecoratedToken element = null]
@init{
}
:
	a0 = 'DEFINE' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
	(
		a1 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a1.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__NAME), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a1).getLine(), ((CommonToken) a1).getCharPositionInLine(), ((CommonToken) a1).getStartIndex(), ((CommonToken) a1).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__NAME), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a1, element);
		}
	)
	
	(
		a2 = '[' {
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken)a2, element);
		}
		
		(
			(
				a3 = QUOTED_39_39				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a3.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__PREFIX), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a3).getLine(), ((CommonToken) a3).getCharPositionInLine(), ((CommonToken) a3).getStartIndex(), ((CommonToken) a3).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__PREFIX), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a3, element);
				}
			)
			
		)
		
		a4 = ']' {
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken)a4, element);
		}
		
	)
	
	(
		a5 = QUOTED_36_36		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_36_36");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a5.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__REGEX), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a5).getLine(), ((CommonToken) a5).getCharPositionInLine(), ((CommonToken) a5).getStartIndex(), ((CommonToken) a5).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__REGEX), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a5, element);
		}
	)
	
	(
		a6 = '[' {
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken)a6, element);
		}
		
		(
			(
				a7 = QUOTED_39_39				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUOTED_39_39");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a7.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__SUFFIX), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a7).getLine(), ((CommonToken) a7).getCharPositionInLine(), ((CommonToken) a7).getStartIndex(), ((CommonToken) a7).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__SUFFIX), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a7, element);
				}
			)
			
		)
		
		a8 = ']' {
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken)a8, element);
		}
		
	)
	
	(
		(
			a9 = 'COLLECT' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a9, element);
			}
			
			a10 = 'IN' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a10, element);
			}
			
			(
				a11 = QUALIFIED_NAME				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createDecoratedToken();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a11.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__ATTRIBUTE_NAME), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a11).getLine(), ((CommonToken) a11).getCharPositionInLine(), ((CommonToken) a11).getStartIndex(), ((CommonToken) a11).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.DECORATED_TOKEN__ATTRIBUTE_NAME), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a11, element);
				}
			)
			
		)
		
	)?	
;

predefinedtoken returns [org.emftext.sdk.concretesyntax.PreDefinedToken element = null]
@init{
}
:
	a0 = 'PREDEFINED' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
	(
		a1 = QUALIFIED_NAME		
		{
			if (element == null) {
				element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();
			}
			org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
			tokenResolver.setOptions(getOptions());
			org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
			tokenResolver.resolve(a1.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.PRE_DEFINED_TOKEN__NAME), result);
			Object resolvedObject = result.getResolvedToken();
			if (resolvedObject == null) {
				getResource().addError(result.getErrorMessage(), ((CommonToken) a1).getLine(), ((CommonToken) a1).getCharPositionInLine(), ((CommonToken) a1).getStartIndex(), ((CommonToken) a1).getStopIndex());
			}
			java.lang.String resolved = (java.lang.String)resolvedObject;
			if (resolved != null) {
				element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.PRE_DEFINED_TOKEN__NAME), resolved);
			}
			collectHiddenTokens(element);
			copyLocalizationInfos((CommonToken) a1, element);
		}
	)
	
	(
		(
			a2 = 'COLLECT' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a2, element);
			}
			
			a3 = 'IN' {
				if (element == null) {
					element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();
				}
				collectHiddenTokens(element);
				copyLocalizationInfos((CommonToken)a3, element);
			}
			
			(
				a4 = QUALIFIED_NAME				
				{
					if (element == null) {
						element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createPreDefinedToken();
					}
					org.emftext.runtime.resource.ITokenResolver tokenResolver = tokenResolverFactory.createTokenResolver("QUALIFIED_NAME");
					tokenResolver.setOptions(getOptions());
					org.emftext.runtime.resource.ITokenResolveResult result = getFreshTokenResolveResult();
					tokenResolver.resolve(a4.getText(), element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.PRE_DEFINED_TOKEN__ATTRIBUTE_NAME), result);
					Object resolvedObject = result.getResolvedToken();
					if (resolvedObject == null) {
						getResource().addError(result.getErrorMessage(), ((CommonToken) a4).getLine(), ((CommonToken) a4).getCharPositionInLine(), ((CommonToken) a4).getStartIndex(), ((CommonToken) a4).getStopIndex());
					}
					java.lang.String resolved = (java.lang.String)resolvedObject;
					if (resolved != null) {
						element.eSet(element.eClass().getEStructuralFeature(org.emftext.sdk.concretesyntax.ConcretesyntaxPackage.PRE_DEFINED_TOKEN__ATTRIBUTE_NAME), resolved);
					}
					collectHiddenTokens(element);
					copyLocalizationInfos((CommonToken) a4, element);
				}
			)
			
		)
		
	)?	
;

keywordabstract returns [org.emftext.sdk.concretesyntax.Abstract element = null]
@init{
}
:
	a0 = 'ABSTRACT' {
		if (element == null) {
			element = org.emftext.sdk.concretesyntax.impl.ConcretesyntaxFactoryImpl.eINSTANCE.createAbstract();
		}
		collectHiddenTokens(element);
		copyLocalizationInfos((CommonToken)a0, element);
	}
	
;

tokendefinition returns [org.emftext.sdk.concretesyntax.TokenDefinition element = null]
:
	c0 = normaltoken{ element = c0; }
	|	c1 = decoratedtoken{ element = c1; }
	|	c2 = predefinedtoken{ element = c2; }
	
;

definition returns [org.emftext.sdk.concretesyntax.Definition element = null]
:
	c0 = csstring{ element = c0; }
	|	c1 = definedplaceholder{ element = c1; }
	|	c2 = derivedplaceholder{ element = c2; }
	|	c3 = containment{ element = c3; }
	|	c4 = compounddefinition{ element = c4; }
	|	c5 = whitespaces{ element = c5; }
	|	c6 = linebreak{ element = c6; }
	
;

cardinality returns [org.emftext.sdk.concretesyntax.Cardinality element = null]
:
	c0 = plus{ element = c0; }
	|	c1 = star{ element = c1; }
	|	c2 = questionmark{ element = c2; }
	
;

COMMENTS:
	'//'(~('\n'|'\r'))*
	{ _channel = 99; }
;
QUALIFIED_NAME:
	('A'..'Z'|'a'..'z'|'_')('A'..'Z'|'a'..'z'|'_'|'-'|'0'..'9')*('.'('A'..'Z'|'a'..'z'|'_'|'-'|'0'..'9')+)*	;
NUMBER:
	('0'..'9')+	;
WHITESPACE:
	(' '|'\t'|'\f')
	{ _channel = 99; }
;
LINEBREAK:
	('\r\n'|'\r'|'\n')
	{ _channel = 99; }
;
QUOTED_60_62:
	('<')
	(~('>')|('\\''>'))*	('>')
	;
QUOTED_39_39:
	('\'')
	(~('\'')|('\\''\''))*	('\'')
	;
QUOTED_36_36:
	('$')
	(~('$')|('\\''$'))*	('$')
	;
QUOTED_34_34:
	('"')
	(~('"')|('\\''"'))*	('"')
	;
