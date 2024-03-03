public extension Optional {
    enum Error: Swift.Error, CustomStringConvertible {
        case unexpectedNil(_ optional: String)

        public var description: String {
            switch self {
            case let .unexpectedNil(optional): #"Unexpectedly found nil while unwrapping "\#(optional)""#
            }
        }
    }
}
