package org.emftext.sdk.concretesyntax.resource.cs.analysis;

import org.eclipse.emf.codegen.ecore.genmodel.GenClass;
import org.eclipse.emf.codegen.ecore.genmodel.GenFeature;
import org.emftext.runtime.resource.IReferenceResolveResult;
import org.emftext.sdk.concretesyntax.resource.cs.analysis.helper.MetaclassReferenceResolver;

public class ContainmentTypesReferenceResolver extends org.emftext.runtime.resource.impl.AbstractReferenceResolver<org.emftext.sdk.concretesyntax.Containment, GenClass> {
	
	private MetaclassReferenceResolver resolver = new MetaclassReferenceResolver();
	
	@Override
	protected java.lang.String doDeResolve(GenClass element, org.emftext.sdk.concretesyntax.Containment container, org.eclipse.emf.ecore.EReference reference) {
		return resolver.deResolve(element, container, reference);
	}

	@Override
	protected void doResolve(java.lang.String identifier, org.emftext.sdk.concretesyntax.Containment container, org.eclipse.emf.ecore.EReference reference, int position, boolean resolveFuzzy, IReferenceResolveResult<GenClass> result) {
		GenClass superType = null;
		final GenFeature feature = container.getFeature();
		if (feature != null && feature.getEcoreFeature() != null) {
			superType = feature.getTypeGenClass();
		}
		resolver.doResolve(identifier, container, reference, position, resolveFuzzy, result, superType, true);
	}
}
