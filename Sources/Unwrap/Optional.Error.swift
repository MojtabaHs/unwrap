public extension Optional {
    enum Error: Swift.Error {
        case unexpectedNil(_ optional: String)
    }
}
