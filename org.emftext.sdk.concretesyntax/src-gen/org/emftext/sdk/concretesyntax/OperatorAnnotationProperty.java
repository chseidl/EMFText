/**
 * TESTCOPYRIGHT
 *
 * $Id$
 */
package org.emftext.sdk.concretesyntax;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Operator Annotation Property</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * @see org.emftext.sdk.concretesyntax.ConcretesyntaxPackage#getOperatorAnnotationProperty()
 * @model
 * @generated
 */
public enum OperatorAnnotationProperty implements Enumerator {
	/**
	 * The '<em><b>Type</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #TYPE_VALUE
	 * @generated
	 * @ordered
	 */
	TYPE(0, "type", "type"),

	/**
	 * The '<em><b>Identifier</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #IDENTIFIER_VALUE
	 * @generated
	 * @ordered
	 */
	IDENTIFIER(1, "identifier", "identifier"),

	/**
	 * The '<em><b>Weight</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #WEIGHT_VALUE
	 * @generated
	 * @ordered
	 */
	WEIGHT(2, "weight", "weight");

	/**
	 * The '<em><b>Type</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>Type</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #TYPE
	 * @model name="type"
	 * @generated
	 * @ordered
	 */
	public static final int TYPE_VALUE = 0;

	/**
	 * The '<em><b>Identifier</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>Identifier</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #IDENTIFIER
	 * @model name="identifier"
	 * @generated
	 * @ordered
	 */
	public static final int IDENTIFIER_VALUE = 1;

	/**
	 * The '<em><b>Weight</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>Weight</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #WEIGHT
	 * @model name="weight"
	 * @generated
	 * @ordered
	 */
	public static final int WEIGHT_VALUE = 2;

	/**
	 * An array of all the '<em><b>Operator Annotation Property</b></em>' enumerators.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static final OperatorAnnotationProperty[] VALUES_ARRAY =
		new OperatorAnnotationProperty[] {
			TYPE,
			IDENTIFIER,
			WEIGHT,
		};

	/**
	 * A public read-only list of all the '<em><b>Operator Annotation Property</b></em>' enumerators.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final List<OperatorAnnotationProperty> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

	/**
	 * Returns the '<em><b>Operator Annotation Property</b></em>' literal with the specified literal value.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static OperatorAnnotationProperty get(String literal) {
		for (int i = 0; i < VALUES_ARRAY.length; ++i) {
			OperatorAnnotationProperty result = VALUES_ARRAY[i];
			if (result.toString().equals(literal)) {
				return result;
			}
		}
		return null;
	}

	/**
	 * Returns the '<em><b>Operator Annotation Property</b></em>' literal with the specified name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static OperatorAnnotationProperty getByName(String name) {
		for (int i = 0; i < VALUES_ARRAY.length; ++i) {
			OperatorAnnotationProperty result = VALUES_ARRAY[i];
			if (result.getName().equals(name)) {
				return result;
			}
		}
		return null;
	}

	/**
	 * Returns the '<em><b>Operator Annotation Property</b></em>' literal with the specified integer value.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static OperatorAnnotationProperty get(int value) {
		switch (value) {
			case TYPE_VALUE: return TYPE;
			case IDENTIFIER_VALUE: return IDENTIFIER;
			case WEIGHT_VALUE: return WEIGHT;
		}
		return null;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private final int value;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private final String name;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private final String literal;

	/**
	 * Only this class can construct instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private OperatorAnnotationProperty(int value, String name, String literal) {
		this.value = value;
		this.name = name;
		this.literal = literal;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getValue() {
	  return value;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getName() {
	  return name;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getLiteral() {
	  return literal;
	}

	/**
	 * Returns the literal value of the enumerator, which is its string representation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		return literal;
	}
	
} //OperatorAnnotationProperty
