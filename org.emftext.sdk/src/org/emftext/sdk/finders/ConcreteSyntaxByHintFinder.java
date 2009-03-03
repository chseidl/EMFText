package org.emftext.sdk.finders;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.emftext.runtime.resource.ITextResource;
import org.emftext.sdk.concretesyntax.ConcreteSyntax;
import org.emftext.sdk.concretesyntax.Import;

/**
 * A finder that searches in the current Eclipse workspace for concrete
 * syntax definitions.
 */
public class ConcreteSyntaxByHintFinder implements IConcreteSyntaxFinder {

	public IConcreteSyntaxFinderResult findConcreteSyntax(String csURI, String locationHint, Import container, ITextResource resource) {
		final ResourceSet rs = new ResourceSetImpl();
		
		if (locationHint == null) {
			return null;
		}
		URI hintURI = null;
		if(locationHint.contains(":")) {
			// locationHint is an absolute path - we can use it as it is
			hintURI = URI.createURI(locationHint);
		}
		else {
			// locationHint is an relative path - we must resolve it
			URI containerURI = container.eResource().getURI();
			hintURI = URI.createURI(locationHint).resolve(containerURI);
		}
		if ("cs".equals(hintURI.fileExtension())) {
			Resource csResource = null;
			
			try {
				csResource = rs.getResource(hintURI, true);
			} catch (Exception e) {}
			
			EList<EObject> contents = null; 
			if (csResource != null) {
				contents = csResource.getContents();	
			}
			if (contents != null && contents.size() > 0) {
				if(contents.get(0) instanceof ConcreteSyntax) {
					return new ConcreteSyntaxFinderResult((ConcreteSyntax)contents.get(0));
				}
			}
		}
       	return null;
	}
}
