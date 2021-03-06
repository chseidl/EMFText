/*******************************************************************************
 * Copyright (c) 2006-2009 
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
package org.emftext.runtime.resource;

import org.eclipse.emf.common.util.URI;

/**
 * Implementors of this interface map identifiers to URIs.
 * This is sometime necessary when resolving references depends 
 * on the resolution of others.
 * 
 * @param <ReferenceType> unused type parameter which is needed to implement IReferenceMapping.
 */
public interface IURIMapping<ReferenceType> extends IReferenceMapping<ReferenceType> {
	
	/**
	 * Returns an alternative proxy URI that should follow EMF's default naming scheme
	 * such that it can be resolved by the default resolution mechanism that will be called
	 * on this URI (see <code>Resource.getEObject()</code>).
	 */
	public URI getTargetIdentifier();
}
