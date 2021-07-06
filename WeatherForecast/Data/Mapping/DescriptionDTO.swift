//
//  DescriptionDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

public struct DescriptionDTO {
    public var value: String?

    public init(value: String?) {
        self.value = value
    }
}

extension DescriptionDTO {
    
    func toDomain() -> Description {
        return Description(value: value)
    }
}

extension DescriptionDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case value
    }
}

// MARK: WeatherDesc convenience initializers and mutators

public extension DescriptionDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(DescriptionDTO.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        value: String?? = nil
    ) -> DescriptionDTO {
        return DescriptionDTO(
            value: value ?? self.value
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
