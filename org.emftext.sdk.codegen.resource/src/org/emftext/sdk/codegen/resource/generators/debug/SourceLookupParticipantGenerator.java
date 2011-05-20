package org.emftext.sdk.codegen.resource.generators.debug;

import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.ABSTRACT_SOURCE_LOOKUP_PARTICIPANT;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.CORE_EXCEPTION;

import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.parameters.ArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.generators.JavaBaseGenerator;

public class SourceLookupParticipantGenerator extends JavaBaseGenerator<ArtifactParameter<GenerationContext>> {

	public void generateJavaContents(JavaComposite sc) {
		if (!getContext().isDebugSupportEnabled()) {
			generateEmptyClass(sc);
			return;
		}
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		sc.addLineBreak();
		sc.add("public class " + getResourceClassName() + " extends " + ABSTRACT_SOURCE_LOOKUP_PARTICIPANT + " {");
		sc.addLineBreak();
		addGetSourceNameMethod(sc);
		sc.add("}");
	}

	private void addGetSourceNameMethod(JavaComposite sc) {
		sc.add("public String getSourceName(Object object) throws " + CORE_EXCEPTION + " {");
		sc.add("if (object instanceof " + stackFrameClassName + ") {");
		sc.add(stackFrameClassName + " frame = (" + stackFrameClassName + ") object;");
		sc.add("return frame.getSource();");
		sc.add("}");
		sc.add("return null;");
		sc.add("}");
		sc.addLineBreak();
	}
}
