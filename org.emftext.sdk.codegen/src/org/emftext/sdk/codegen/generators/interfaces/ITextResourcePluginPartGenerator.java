package org.emftext.sdk.codegen.generators.interfaces;

import java.io.PrintWriter;

import org.emftext.sdk.codegen.EArtifact;
import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.generators.BaseGenerator;

public class ITextResourcePluginPartGenerator extends BaseGenerator {

	private String iMetaInformationClassName;

	public ITextResourcePluginPartGenerator() {
		super();
	}

	private ITextResourcePluginPartGenerator(GenerationContext context) {
		super(context, EArtifact.I_TEXT_RESOURCE_PLUGIN_PART);
		iMetaInformationClassName = getContext().getQualifiedClassName(EArtifact.META_INFORMATION);
	}

	public IGenerator newInstance(GenerationContext context) {
		return new ITextResourcePluginPartGenerator(context);
	}

	public boolean generate(PrintWriter out) {
		org.emftext.sdk.codegen.composites.StringComposite sc = new org.emftext.sdk.codegen.composites.JavaComposite();
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		
		sc.add("// This interface is extended by all other EMFText runtime");
		sc.add("// API interfaces for generated components. It provides");
		sc.add("// access to the plug-in meta information.");
		
		sc.add("public interface " + getResourceClassName() + " {");
		sc.addLineBreak();
		
		sc.add("// Returns a meta information object for the language plug-in");
		sc.add("// that contains this part.");
		
		sc.add("public " + iMetaInformationClassName + " getMetaInformation();");
		sc.add("}");
		out.print(sc.toString());
		return true;
	}
}
