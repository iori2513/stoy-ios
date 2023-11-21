import Foundation

// Date型をデコードするためのもの


protocol DateDecodingStrategy {
    static var dateFormat: String { get }
}


struct DefaultDateDecodingStrategy: DateDecodingStrategy {
    static var dateFormat: String {
        return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
}

// Date型を自動でデコードするプロパティラッパー
@propertyWrapper
struct AutoDecodedDate: Decodable {
    var wrappedValue: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DefaultDateDecodingStrategy.dateFormat
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        if let date = dateFormatter.date(from: dateString) {
            self.wrappedValue = date
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Date string does not match the expected format"
            )
        }
    }
}
