package org.emftext.sdk.codegen.generators.interfaces;

import static org.emftext.sdk.codegen.generators.IClassNameConstants.MAP;

import java.io.PrintWriter;

import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.generators.BaseGenerator;

public class IConfigurableGenerator extends BaseGenerator {

	public IConfigurableGenerator() {
		super();
	}

	private IConfigurableGenerator(GenerationContext context) {
		super(context, EArtifact.I_CONFIGURABLE);
	}

	public IGenerator newInstance(GenerationContext context) {
		return new IConfigurableGenerator(context);
	}

	public boolean generate(PrintWriter out) {
		org.emftext.sdk.codegen.composites.StringComposite sc = new org.emftext.sdk.codegen.composites.JavaComposite();
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		
		sc.add("// Implementors of this interface can be configured by a");
		sc.add("// map of options (or parameters).");
		
		sc.add("public interface " + getResourceClassName() + " {");
		sc.addLineBreak();
		
		sc.add("// Passed the options given by the map to the configurable");
		sc.add("// object.");
		
		sc.add("public void setOptions(" + MAP + "<?,?> options);");
		sc.add("}");
		out.print(sc.toString());
		return true;
	}
}
