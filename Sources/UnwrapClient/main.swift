import Unwrap

let myOptional: Int? = nil

do {
    _ = try #unwrap(myOptional)
} catch {
    print(error)
}
