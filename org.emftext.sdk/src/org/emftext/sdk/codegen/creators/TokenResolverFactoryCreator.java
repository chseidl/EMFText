package org.emftext.sdk.codegen.creators;

import java.io.File;
import java.util.Collection;

import org.emftext.sdk.codegen.GenerationContext;
import org.emftext.sdk.codegen.IGenerator;
import org.emftext.sdk.codegen.generators.TokenResolverFactoryGenerator;
import org.emftext.sdk.concretesyntax.OptionTypes;

/**
 * Creates the Java file for the token resolver factory class using the content
 * provided by TokenResolverFactoryGenerator.
 */
public class TokenResolverFactoryCreator extends AbstractArtifactCreator {

	public TokenResolverFactoryCreator() {
		super("token resolver factory");
	}

	@Override
	public Collection<IArtifact> getArtifactsToCreate(GenerationContext context) {
	    File tokenResolverFactoryFile = context.getTokenResolverFactoryFile();
		IGenerator generator = new TokenResolverFactoryGenerator(context);
		
		Artifact artifact = new Artifact(tokenResolverFactoryFile, invokeGeneration(generator, context.getProblemCollector()));
		return toList(artifact);
	}

	public OptionTypes getOverrideOption() {
		return OptionTypes.OVERRIDE_TOKEN_RESOLVER_FACTORY;
	}
}
