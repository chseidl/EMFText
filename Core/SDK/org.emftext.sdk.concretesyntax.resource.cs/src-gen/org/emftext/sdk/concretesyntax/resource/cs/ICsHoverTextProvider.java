/*******************************************************************************
 * Copyright (c) 2006-2014
 * Software Technology Group, Dresden University of Technology
 * DevBoost GmbH, Berlin, Amtsgericht Charlottenburg, HRB 140026
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Software Technology Group - TU Dresden, Germany;
 *   DevBoost GmbH - Berlin, Germany
 *      - initial API and implementation
 ******************************************************************************/

package org.emftext.sdk.concretesyntax.resource.cs;

import org.eclipse.emf.ecore.EObject;

public interface ICsHoverTextProvider {
	
	/**
	 * Returns the hoves text that is shown when the mouse pointer rests over the
	 * given object. The hover text can contain HTML.
	 */
	public String getHoverText(EObject object);
	
	/**
	 * Returns the hoves text that is shown when the mouse pointer rests over a
	 * reference to the given object. The hover text can contain HTML.
	 */
	public String getHoverText(EObject container, EObject referencedObject);
	
}
