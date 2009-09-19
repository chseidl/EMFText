package org.emftext.sdk.codegen.generators.interfaces;

import java.io.PrintWriter;

import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.generators.BaseGenerator;

public class ITokenStyleGenerator extends BaseGenerator {

	public ITokenStyleGenerator() {
		super();
	}

	private ITokenStyleGenerator(GenerationContext context) {
		super(context, EArtifact.I_TOKEN_STYLE);
	}

	public IGenerator newInstance(GenerationContext context) {
		return new ITokenStyleGenerator(context);
	}

	public boolean generate(PrintWriter out) {
		org.emftext.sdk.codegen.composites.StringComposite sc = new org.emftext.sdk.codegen.composites.JavaComposite();
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		
		sc.add("// A common interface for token styles. Text resources must");
		sc.add("// return style information using object implementing this");
		sc.add("// interface.");
		sc.add("public interface " + getResourceClassName() + " {");
		sc.addLineBreak();
		
		sc.add("// Returns the color of the token as array of length 3.");
		sc.add("public int[] getColorAsRGB();");
		sc.addLineBreak();
		
		sc.add("// Returns true if the token must be displayed in bold face.");
		sc.add("public boolean isBold();");
		sc.addLineBreak();
		
		sc.add("// Returns true if the token must be displayed in italic face.");
		sc.add("public boolean isItalic();");
		sc.addLineBreak();
		
		sc.add("// Returns true if the token must be displayed in strike through style.");
		sc.add("public boolean isStrikethrough();");
		sc.addLineBreak();
		
		sc.add("// Returns true if the token must be displayed underline.");
		sc.add("public boolean isUnderline();");
		sc.add("}");
		out.print(sc.toString());
		return true;
	}
}
