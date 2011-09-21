/*******************************************************************************
 * Copyright (c) 2006-2011
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

package org.emftext.sdk.concretesyntax.resource.cs.ui;

public class CsOutlinePageCollapseAllAction extends org.emftext.sdk.concretesyntax.resource.cs.ui.AbstractCsOutlinePageAction {
	
	public CsOutlinePageCollapseAllAction(org.emftext.sdk.concretesyntax.resource.cs.ui.CsOutlinePageTreeViewer treeViewer) {
		super(treeViewer, "Collapse all", org.eclipse.jface.action.IAction.AS_PUSH_BUTTON);
		initialize("icons/collapse_all_icon.gif");
	}
	
	public void runInternal(boolean on) {
		getTreeViewer().collapseAll();
	}
	
	public boolean keepState() {
		return false;
	}
	
}