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
package org.emftext.sdk.codegen.util;

import java.util.LinkedHashMap;
import java.util.Map;

import org.eclipse.emf.codegen.ecore.genmodel.GenClass;

/**
 * The GenClassCache holds a hash map that maps GenClasses and their
 * qualified interfaces name. This cache is used to get rid of performance
 * problems that were caused by the somewhat slow computation of the
 * interface names in EMF. 
 */
public class GenClassCache {

	private Map<GenClass, String> qualifiedInterfaceNameCache = new LinkedHashMap<GenClass, String>();

	public String getQualifiedInterfaceName(GenClass genClass) {
		if (!qualifiedInterfaceNameCache.containsKey(genClass)) {
			String qualifiedInterfaceName = genClass.getQualifiedInterfaceName();
			qualifiedInterfaceNameCache.put(genClass, qualifiedInterfaceName);
		}
		return qualifiedInterfaceNameCache.get(genClass);
	}
}
