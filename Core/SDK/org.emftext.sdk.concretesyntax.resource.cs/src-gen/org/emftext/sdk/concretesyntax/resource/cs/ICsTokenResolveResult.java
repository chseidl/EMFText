/*******************************************************************************
 * Copyright (c) 2006-2015
 * Software Technology Group, Dresden University of Technology
 * DevBoost GmbH, Dresden, Amtsgericht Dresden, HRB 34001
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Software Technology Group - TU Dresden, Germany;
 *   DevBoost GmbH - Dresden, Germany
 *      - initial API and implementation
 ******************************************************************************/

package org.emftext.sdk.concretesyntax.resource.cs;


/**
 * Implementations of this interface are used store the result of resolving a
 * token.
 */
public interface ICsTokenResolveResult {
	
	/**
	 * Returns the error message that describes what went wrong while resolving a
	 * token.
	 */
	public String getErrorMessage();
	
	/**
	 * <p>
	 * Sets the error message that describes what went wrong while resolving a token.
	 * If a mapping for the token was already found (i.e., setResult() was called
	 * before), the call to this method is ignored. If setResult() is called
	 * afterwards, the error message is also discarded.
	 * </p>
	 * 
	 * @param message the error that prevented resolving the token
	 */
	public void setErrorMessage(String message);
	
	/**
	 * <p>
	 * Sets the result of resolving a token.
	 * </p>
	 * 
	 * @param resolvedToken the object the token was resolved to
	 */
	public void setResolvedToken(Object resolvedToken);
	
	/**
	 * <p>
	 * Returns the result of resolving a token or null if it could not be resolved
	 * correctly.
	 * </p>
	 * 
	 * @return the object the token was resolved to
	 */
	public Object getResolvedToken();
	
}
