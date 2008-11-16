package org.reuseware.emftextedit.sdk.codegen;

import java.io.PrintWriter;
import java.util.Collection;

/**
 * Basic generator interfaces which should be implemented by all generators 
 * in org.reuseware.emftextedit.codegen.* .
 * 
 * @author skarol
 */
public interface IGenerator {
	
	public boolean generate(PrintWriter out);
	
	public Collection<GenerationProblem> getOccuredErrors();
	public Collection<GenerationProblem> getOccuredWarningsAndErrors();
}
