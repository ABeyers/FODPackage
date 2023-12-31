public protocol ContentDecodable {
  associatedtype DecodableType
  static var decodable: DecodableType.Type { get }
  init(decoded: DecodableType) throws
  static func decode<CoderType: Decoder>(
    _ data: CoderType.DataType,
    code: Int,
    using coder: CoderType
  ) throws -> DecodableType
}
