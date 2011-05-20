package org.emftext.sdk.codegen.resource.generators.debug;

import static org.emftext.sdk.codegen.composites.IClassNameConstants.ARRAY_LIST;
import static org.emftext.sdk.codegen.composites.IClassNameConstants.LIST;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.BUFFERED_READER;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.E_OBJECT;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.E_STRUCTURAL_FEATURE;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.FIELD;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.INPUT_STREAM;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.INPUT_STREAM_READER;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.IO_EXCEPTION;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.LINKED_HASH_MAP;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.MAP;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.PRINT_STREAM;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.SERVER_SOCKET;
import static org.emftext.sdk.codegen.resource.generators.IClassNameConstants.SOCKET;

import org.emftext.sdk.codegen.composites.JavaComposite;
import org.emftext.sdk.codegen.parameters.ArtifactParameter;
import org.emftext.sdk.codegen.resource.GenerationContext;
import org.emftext.sdk.codegen.resource.generators.JavaBaseGenerator;

public class DebuggerListenerGenerator extends JavaBaseGenerator<ArtifactParameter<GenerationContext>> {

	public void generateJavaContents(JavaComposite sc) {
		if (!getContext().isDebugSupportEnabled()) {
			generateEmptyClass(sc);
			return;
		}
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
		
		sc.addJavadoc(
			"The DebuggerListener receives commands from the Eclipse Debug framework and " +
			"sends these commands to a debuggable process (e.g., an interpreter or generated " +
			"code)."
		);
		sc.add("public class " + getResourceClassName() + "<ResultType, ContextType> implements Runnable {");
		sc.addLineBreak();
		addConstants(sc);
		addFields(sc);
		addMethods(sc);
		sc.add("}");
	}

	private void addMethods(JavaComposite sc) {
		addRunMethod(sc);
		addRunDebuggerMethod(sc);
		addConvertToStringMethod(sc);
		addIsPrimitiveTypeClassMethod(sc);
		addGetObjectIDMethod(sc);
		addGetInterpreterMethod(sc);
		addSetInterpreterMethod(sc);
	}

	private void addConstants(JavaComposite sc) {
		sc.add("private static final Class<?>[] PRIMITIVE_TYPES = new Class<?>[] {");
		sc.add("String.class,");
		sc.add("Integer.class,");
		sc.add("Long.class,");
		sc.add("Boolean.class,");
		sc.add("Float.class,");
		sc.add("Double.class");
		sc.add("};");
		sc.addLineBreak();
	}

	private void addFields(JavaComposite sc) {
		sc.add("private boolean stop = false;");
		sc.add("private " + abstractDebuggableClassName + " debuggable;");
		sc.add("private long id = 0;");
		sc.add("private " + MAP + "<Long, String> nameMap = new " + LINKED_HASH_MAP + "<Long, String>();");
		sc.add("private " + MAP + "<Long, Object> objectMap = new " + LINKED_HASH_MAP + "<Long, Object>();");
		sc.addLineBreak();
		sc.add("private " + debugCommunicationHelperClassName + " communicationHelper = new " + debugCommunicationHelperClassName + "();");
		sc.addLineBreak();
	}

	private void addRunMethod(JavaComposite sc) {
		sc.add("public void run() {");
		sc.add("try {");
		sc.add("runDebugger();");
		sc.add("} catch (" + IO_EXCEPTION + " e) {");
		// TODO
		sc.add("e.printStackTrace();");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addRunDebuggerMethod(JavaComposite sc) {
		sc.add("private void runDebugger() throws " + IO_EXCEPTION + " {");
		sc.add(SERVER_SOCKET + " server = new " + SERVER_SOCKET + "(" + debugProxyClassName + ".DEBUG_PORT);");
		//sc.add("System.out.println(\"WebtestDebuggerListener.runDebugger() creating proxy server socket (waiting for connection)...\");");
		sc.add(SOCKET + " accept = server.accept();");
		//sc.add("System.out.println(\"WebtestDebuggerListener.runDebugger() proxy server socket (connected).\");");
		sc.add(INPUT_STREAM + " inputStream = accept.getInputStream();");
		sc.add(BUFFERED_READER + " reader = new " + BUFFERED_READER + "(new " + INPUT_STREAM_READER + "(inputStream));");
		sc.add(PRINT_STREAM + " output = new " + PRINT_STREAM + "(accept.getOutputStream());");
		sc.addLineBreak();
		sc.add(debugMessageClassName + " command;");
		sc.add("while (!stop) {");
		//sc.add("//System.out.println(\"WebtestDebuggerListener.runDebugger() loop - waiting for input.\");");
		sc.add("command = communicationHelper.receive(reader);");
		sc.add("if (command == null) {");
		sc.add("break;");
		sc.add("}");
		//sc.add("//System.out.println(\"WebtestDebuggerListener.runDebugger() received command: \" + command);");
		sc.add("if (command.hasType(" + eDebugMessageTypesClassName + ".EXIT)) {");
		sc.add("debuggable.terminate();");
		sc.add("stop = true;");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".RESUME)) {");
		sc.add("debuggable.resume();");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".STEP_OVER)) {");
		sc.add("debuggable.stepOver();");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".STEP_INTO)) {");
		sc.add("debuggable.stepInto();");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".STEP_RETURN)) {");
		sc.add("debuggable.stepReturn();");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".ADD_LINE_BREAKPOINT)) {");
		sc.add("int line = Integer.parseInt(command.getArgument(0));");
		sc.add("debuggable.addLineBreakpoint(line);");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".REMOVE_LINE_BREAKPOINT)) {");
		sc.add("int line = Integer.parseInt(command.getArgument(0));");
		sc.add("debuggable.removeLineBreakpoint(line);");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".GET_STACK)) {");
		sc.add("final String[] stack = debuggable.getStack();");
		sc.add("String controlStack = " + stringUtilClassName + ".encode('#', stack);");
		sc.add(debugMessageClassName + " message = new " + debugMessageClassName + "(" + eDebugMessageTypesClassName + ".GET_STACK_RESPONSE, new String[] {controlStack});");
		sc.add("communicationHelper.sendEvent(message, output);");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".GET_FRAME_VARIABLES)) {");
		sc.add(MAP + "<String, Object> frameVariables = debuggable.getFrameVariables();");
		sc.addLineBreak();
		sc.add(LIST + "<String> topVariableIDs = new " + ARRAY_LIST + "<String>();");
		sc.add("for (String name : frameVariables.keySet()) {");
		sc.add("Object value = frameVariables.get(name);");
		sc.add("long id = getObjectID(name, value);");
		sc.add("topVariableIDs.add(Long.toString(id));");
		sc.add("}");
		sc.add(debugMessageClassName + " message = new " + debugMessageClassName + "(" + eDebugMessageTypesClassName + ".GET_FRAME_VARIABLES_RESPONSE, topVariableIDs);");
		sc.add("communicationHelper.sendEvent(message, output);");
		sc.add("} else if (command.hasType(" + eDebugMessageTypesClassName + ".GET_VARIABLE)) {");
		sc.add("long requestedID = Long.parseLong(command.getArgument(0));");
		sc.addComment("create variable string");
		sc.add("Object next = objectMap.get(requestedID);");
		sc.add("String varString = convertToString(requestedID, next);");
		sc.add(debugMessageClassName + " message = new " + debugMessageClassName + "(" + eDebugMessageTypesClassName + ".GET_VARIABLE_RESPONSE, new String[] {varString});");
		sc.add("communicationHelper.sendEvent(message, output);");
		sc.add("} else {");
		sc.add("System.out.println(\"ERROR: Unrecognized command (\" + command + \")!\");");
		sc.add("output.append(\"Unrecognized command!\");");
		sc.add("}");
		sc.add("}");
		sc.addComment("closing server");
		sc.add("server.close();");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addConvertToStringMethod(JavaComposite sc) {
		sc.add("private String convertToString(long id, Object object) {");
		sc.add("String name = nameMap.get(id);");
		sc.addLineBreak();
		sc.add(MAP + "<String, Object> properties = new " + LINKED_HASH_MAP + "<String, Object>();");
		sc.add("properties.put(\"!name\", name);");
		sc.add("properties.put(\"!id\", Long.toString(id));");
		sc.add("properties.put(\"!valueString\", object == null ? \"null\" : object.toString());");
		sc.add("if (object != null) {");
		sc.add("if (object instanceof " + E_OBJECT + ") {");
		sc.add(E_OBJECT + " eObject = (" + E_OBJECT + ") object;");
		sc.add("properties.put(\"!type\", eObject.eClass().getName());");
		sc.addLineBreak();
		sc.add(LIST + "<" + E_STRUCTURAL_FEATURE + "> features = eObject.eClass().getEAllStructuralFeatures();");
		sc.add("for (" + E_STRUCTURAL_FEATURE + " feature : features) {");
		sc.add("Object value = eObject.eGet(feature);");
		sc.add("String featureName = feature.getName();");
		sc.add("long valueID = getObjectID(featureName, value);");
		sc.add("properties.put(featureName, Long.toString(valueID));");
		sc.add("}");
		sc.add("} else {");
		sc.add("Class<? extends Object> javaClass = object.getClass();");
		sc.add("if (!isPrimitiveTypeClass(javaClass)) {");
		sc.add("" + FIELD + "[] fields = javaClass.getDeclaredFields();");
		sc.add("for (" + FIELD + " field : fields) {");
		sc.add("try {");
		sc.add("field.setAccessible(true);");
		sc.add("Object value = field.get(object);");
		sc.add("String fieldName = field.getName();");
		sc.add("long valueID = getObjectID(fieldName, value);");
		sc.add("properties.put(fieldName, Long.toString(valueID));");
		sc.add("} catch (IllegalArgumentException e) {");
		sc.add("e.printStackTrace();");
		sc.add("} catch (IllegalAccessException e) {");
		sc.add("e.printStackTrace();");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
		sc.add("return " + stringUtilClassName + ".convertToString(properties);");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addIsPrimitiveTypeClassMethod(JavaComposite sc) {
		sc.add("private boolean isPrimitiveTypeClass(Class<?> javaClass) {");
		sc.add("for (Class<?> clazz : PRIMITIVE_TYPES) {");
		sc.add("if (clazz.getName().equals(javaClass.getName())) {");
		sc.add("return true;");
		sc.add("}");
		sc.add("}");
		sc.add("return false;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetObjectIDMethod(JavaComposite sc) {
		sc.add("private long getObjectID(String name, Object value) {");
		sc.add("if (objectMap.containsValue(value)) {");
		sc.add("for (Long nextID : objectMap.keySet()) {");
		sc.add("Object next = objectMap.get(nextID);");
		sc.add("if (next == value) {");
		sc.add("return nextID;");
		sc.add("}");
		sc.add("}");
		sc.add("assert false;");
		sc.add("return -1;");
		sc.add("} else {");
		sc.add("long usedID = id;");
		sc.add("nameMap.put(usedID, name);");
		sc.add("objectMap.put(usedID, value);");
		sc.add("id++;");
		sc.add("return usedID;");
		sc.add("}");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addGetInterpreterMethod(JavaComposite sc) {
		sc.add("public " + abstractDebuggableClassName + " getDebuggable() {");
		sc.add("return debuggable;");
		sc.add("}");
		sc.addLineBreak();
	}

	private void addSetInterpreterMethod(JavaComposite sc) {
		sc.add("public void setDebuggable(" + abstractDebuggableClassName + " debuggable) {");
		sc.add("this.debuggable = debuggable;");
		sc.add("}");
		sc.addLineBreak();
	}
}
