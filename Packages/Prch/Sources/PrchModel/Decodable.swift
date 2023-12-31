extension Decodable
  where Self: ContentDecodable, DecodableType == Self {
  public static var decodable: Self.Type {
    Self.self
  }

  public init(decoded: DecodableType) throws {
    self = decoded
  }

  public static func decode<CoderType>(
    _ data: CoderType.DataType,
    code: Int,
    using coder: CoderType
  ) throws -> Self where CoderType: Decoder {
    try coder.decode(Self.self, from: data)
  }
}
