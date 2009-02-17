package org.emftext.sdk.codegen;

import java.io.PrintWriter;

import org.eclipse.emf.ecore.EObject;
import org.emftext.runtime.resource.ITextPrinter;
import org.emftext.runtime.resource.ITextResource;
import org.emftext.sdk.codegen.util.JavaStringComposite;
import org.emftext.sdk.codegen.util.StringComposite;

/**
 * A generator that create a printer class. This class can be
 * subject to modifications.
 * 
 * @author Sven Karol (Sven.Karol@tu-dresden.de)
 */
public class TextPrinterGenerator extends BaseGenerator {
	
	private String basePrinterClassName; 
	
	public TextPrinterGenerator(GenerationContext context, boolean printerBaseExists){
		super(context.getPackageName(), context.getPrinterName());
		if (printerBaseExists) { 
			basePrinterClassName = context.getPrinterBaseClassName();
		} else {
			basePrinterClassName = null;
		}
	}
	
	@Override
	public boolean generate(PrintWriter out) {
		boolean noBaseClass = basePrinterClassName == null;

		StringComposite sc = new JavaStringComposite();
		
		sc.add("package " + getResourcePackageName() + ";");
		sc.addLineBreak();
	    sc.add("/**").addLineBreak();
	    sc.add("* This is the printer class used by EMFText.").addLineBreak();
		if (!noBaseClass) {
			sc.add("* Users may implement own behavior by overriding printing methods in the printer base.").addLineBreak();
			sc.add("* The baseclass contains a pretty printer implementation generated by EMFText which").addLineBreak();
			sc.add("* is not granted to work in all cases, but should work in most cases.").addLineBreak();
		}
		sc.add("*/");
		sc.add("public class " + getResourceClassName() + (noBaseClass ? " implements " + ITextPrinter.class.getName() : " extends " + basePrinterClassName)+ " {");
		sc.addLineBreak();
		sc.add("public " + getResourceClassName() + "(" + java.io.OutputStream.class.getName() + " o, " + ITextResource.class.getName() + " resource) {");
	    if (!noBaseClass) {
	    	sc.add("super(o, resource);");
	    }
	    sc.add("}");
	    
	    if (noBaseClass) {
	    	sc.addLineBreak();
	    	sc.add("public void print(" + EObject.class.getName() + " arg0) throws " + java.io.IOException.class.getName() + " {");
	    	sc.add("// TODO insert printer implementation here.").addLineBreak();
	    	sc.add("}");
	    }
	    sc.add("}");
	    
	    out.print(sc.toString());
		return true;
	}
}
