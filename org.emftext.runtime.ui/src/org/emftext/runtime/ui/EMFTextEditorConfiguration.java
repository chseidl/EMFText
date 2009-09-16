/*******************************************************************************
 * Copyright (c) 2006-2009 
 * Software Technology Group, Dresden University of Technology
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option) any
 * later version. This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * 
 * See the GNU Lesser General Public License for more details. You should have
 * received a copy of the GNU Lesser General Public License along with this
 * program; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
 * Suite 330, Boston, MA  02111-1307 USA
 * 
 * Contributors:
 *   Software Technology Group - TU Dresden, Germany 
 *   - initial API and implementation
 ******************************************************************************/
package org.emftext.runtime.ui;

import org.eclipse.emf.common.util.URI;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.ITextHover;
import org.eclipse.jface.text.contentassist.ContentAssistant;
import org.eclipse.jface.text.contentassist.IContentAssistant;
import org.eclipse.jface.text.hyperlink.IHyperlinkDetector;
import org.eclipse.jface.text.presentation.IPresentationReconciler;
import org.eclipse.jface.text.presentation.PresentationReconciler;
import org.eclipse.jface.text.rules.DefaultDamagerRepairer;
import org.eclipse.jface.text.rules.ITokenScanner;
import org.eclipse.jface.text.source.DefaultAnnotationHover;
import org.eclipse.jface.text.source.IAnnotationHover;
import org.eclipse.jface.text.source.ISourceViewer;
import org.eclipse.jface.text.source.SourceViewerConfiguration;
import org.eclipse.ui.part.FileEditorInput;
import org.emftext.runtime.resource.ITextResource;
import org.emftext.runtime.ui.editor.EMFTextEditor;
import org.emftext.runtime.ui.extensions.HyperlinkDetector;
import org.emftext.runtime.ui.extensions.TextHover;

/**
 * This class provides the configuration for all EMFText editors. It registers
 * content assistance and syntax highlighting.
 */
@Deprecated
public class EMFTextEditorConfiguration extends SourceViewerConfiguration {

	private ColorManager colorManager;
    private EMFTextEditor theEditor; 
    
    /**
     * Create a new editor configuration.
     * 
     * @param editor
     * @param colorManager
     */
	public EMFTextEditorConfiguration(EMFTextEditor editor, ColorManager colorManager) {
		this.theEditor = editor;
        this.colorManager = colorManager;      
	}
    
	public IContentAssistant getContentAssistant(ISourceViewer sourceViewer) {

		ContentAssistant assistant= new ContentAssistant();
		assistant.setContentAssistProcessor(new EMFTextEditorCompletionProcessor(theEditor), IDocument.DEFAULT_CONTENT_TYPE);
		assistant.enableAutoActivation(true);
		assistant.setAutoActivationDelay(500);
		assistant.setProposalPopupOrientation(IContentAssistant.PROPOSAL_OVERLAY);
		assistant.setContextInformationPopupOrientation(IContentAssistant.CONTEXT_INFO_ABOVE);

		return assistant;
	}
	
	public String[] getConfiguredContentTypes(ISourceViewer sourceViewer) {
		return new String[] {
			IDocument.DEFAULT_CONTENT_TYPE,
		 };
	}

	/**
	 * 
	 * @param fileExtension
	 * @return
	 */
    protected ITokenScanner getScanner(String fileName) {
		FileEditorInput input = (FileEditorInput) theEditor.getEditorInput();
		String path = input.getFile().getFullPath().toString();
		ITextResource thisResource = (ITextResource) theEditor.getResourceSet().getResource(URI.createPlatformResourceURI(path, true), true);
		
        return new EMFTextTokenScanner(thisResource, colorManager);
    }

	public IPresentationReconciler getPresentationReconciler(ISourceViewer sourceViewer) {
        
		PresentationReconciler reconciler = new PresentationReconciler();
        String fileName = theEditor.getEditorInput().getName();
        
		DefaultDamagerRepairer repairer = new DefaultDamagerRepairer(getScanner(fileName));
        reconciler.setDamager(repairer, IDocument.DEFAULT_CONTENT_TYPE);
        reconciler.setRepairer(repairer, IDocument.DEFAULT_CONTENT_TYPE);

		return reconciler;
	}
	
	@Override
	public IAnnotationHover getAnnotationHover(ISourceViewer sourceViewer) {
		return new DefaultAnnotationHover();
	}
	
	public ITextHover getTextHover(ISourceViewer sourceViewer, String contentType) {
		return new TextHover(theEditor);
	}
	
	public IHyperlinkDetector[] getHyperlinkDetectors(ISourceViewer sourceViewer) {
		if (sourceViewer == null) {
			return null;
		}
		return new IHyperlinkDetector[] { new HyperlinkDetector(theEditor.getResource()) };
	}
}
