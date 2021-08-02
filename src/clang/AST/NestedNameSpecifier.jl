"""
    mutable struct NestedNameSpecifier <: Any
Holds a `clang::NestedNameSpecifier` opaque pointer.
"""
mutable struct NestedNameSpecifier
    ptr::CXNestedNameSpecifier
end

function get_prefix(x::NestedNameSpecifier)
    @assert x.ptr != C_NULL "NestedNameSpecifier has a NULL pointer."
    return NestedNameSpecifier(clang_NestedNameSpecifier_getPrefix(x.ptr))
end

function contains_errors(x::NestedNameSpecifier)
    @assert x.ptr != C_NULL "NestedNameSpecifier has a NULL pointer."
    return clang_NestedNameSpecifier_containsErrors(x.ptr)
end

function dump(x::NestedNameSpecifier)
    @assert x.ptr != C_NULL "NestedNameSpecifier has a NULL pointer."
    return clang_NestedNameSpecifier_dump(x.ptr)
end
