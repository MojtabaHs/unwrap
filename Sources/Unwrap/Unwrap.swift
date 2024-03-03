/// A macro that takes an `Optional` and returns the wrapped value or throws an error if found `nil`.
@freestanding(expression)
public macro unwrap<Wrapped>(_ value: Wrapped?) -> Wrapped = #externalMacro(
    module: "UnwrapMacros",
    type: "UnwrapMacro"
)
