import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Takes an `Optional` and returns the wrapped value or throws an error if found `nil`.
public struct UnwrapMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return """
        {
            guard let unwrapped = \(argument) else { throw Optional<Any>.Error.unexpectedNil(\(literal: argument.description)) }
            return unwrapped
        }()
        """
    }
}

@main
struct UnwrapPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        UnwrapMacro.self,
    ]
}
