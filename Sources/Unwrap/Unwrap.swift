/// A macro that takes an `Optional` and returns the wrapped value or throws an error if found `nil`.
/// For example,
///
///     try #unwrap(myOptional)
///
/// tries unwrapping the `myOptional` if it has a value. Otherwise, it throws an error to catch.
@freestanding(expression)
public macro unwrap<Wrapped>(_ value: Wrapped?) -> Wrapped = #externalMacro(
    module: "UnwrapMacros",
    type: "UnwrapMacro"
)
