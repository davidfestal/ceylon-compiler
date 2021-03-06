package com.redhat.ceylon.compiler.java.codegen;

/**
 * Enumerates compiler optimizations, which can be disabled and required 
 * by name.
 */
public enum Optimization {

    RangeOpIteration,
    RangeIterationStatic,
    ArrayIterationStatic,
    JavaArrayIterationStatic,
    ArraySequenceIterationStatic,
    ArrayIterationDynamic,
    ArraySequenceIterationDynamic,
    
    PowerUnroll
}
