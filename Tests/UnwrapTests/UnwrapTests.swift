import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(UnwrapMacros)
import UnwrapMacros

let testMacros: [String: Macro.Type] = [
    "unwrap": UnwrapMacro.self,
]
#endif

final class UnwrapTests: XCTestCase {
    func testMacro() throws {
        #if canImport(UnwrapMacros)
        assertMacroExpansion(
            """
            #unwrap(myOptional)
            """,
            expandedSource: """
            {
                guard let unwrapped = myOptional else {
                    throw Optional<Any>.Error.unexpectedNil("myOptional")
                }
                return unwrapped
            }()
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
