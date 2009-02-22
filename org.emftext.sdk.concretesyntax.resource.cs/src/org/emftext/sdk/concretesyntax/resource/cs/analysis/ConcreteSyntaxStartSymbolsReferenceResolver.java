package org.emftext.sdk.concretesyntax.resource.cs.analysis; 

import org.eclipse.emf.codegen.ecore.genmodel.GenClass;
import org.eclipse.emf.ecore.EReference;
import org.emftext.runtime.resource.IReferenceResolveResult;
import org.emftext.runtime.resource.impl.AbstractReferenceResolver;
import org.emftext.sdk.concretesyntax.ConcreteSyntax;
import org.emftext.sdk.concretesyntax.resource.cs.analysis.helper.MetaclassReferenceResolver;

public class ConcreteSyntaxStartSymbolsReferenceResolver extends AbstractReferenceResolver<ConcreteSyntax, GenClass> {
	
	private MetaclassReferenceResolver resolver = new MetaclassReferenceResolver();
	
	@Override
	protected void doResolve(String identifier, ConcreteSyntax container,
			EReference reference, int position, boolean resolveFuzzy, IReferenceResolveResult<GenClass> result) {
		resolver.doResolve(identifier, container, reference, position, resolveFuzzy, result, null, false);
	}

	@Override
	public String deResolve(GenClass element, ConcreteSyntax container, EReference reference){
		return resolver.deResolve(element, container, reference);
	}
}
