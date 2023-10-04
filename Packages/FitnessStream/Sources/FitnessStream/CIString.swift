/// A string wrapper so that Strings are handled in a case-insensitive manner and to prevent mistakes like provding the wring String in a function
public struct CIString: CustomStringConvertible, Identifiable, Codable, Hashable, Equatable, Comparable, ExpressibleByStringLiteral {
  public let raw: String

  public static func == (lhs: CIString, rhs: CIString) -> Bool {
    lhs.raw == rhs.raw
  }

  public static func < (lhs: CIString, rhs: CIString) -> Bool {
    lhs.raw < rhs.raw
  }

  public init(from decoder: Decoder) throws {
    try self.init(String(from: decoder))
  }

  public init(stringLiteral value: String) {
    self.init(value)
  }

  public init(_ description: String) {
    raw = description.lowercased()
  }

  public func encode(to encoder: Encoder) throws {
    try raw.encode(to: encoder)
  }

  public var description: String { raw }
  public var id: String { raw }
}
