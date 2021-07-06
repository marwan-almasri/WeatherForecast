//
//  RequestDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

// MARK: - RequestDTO
public struct RequestDTO {
    public var query: String?
    public var type: String?

    public init(query: String?,
                type: String?) {
        self.query = query
        self.type = type
    }
}

extension RequestDTO {
    func toDomain() -> Request {
        return Request(query: query,
                       type: type)
    }
}

extension RequestDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case query
        case type
    }
}

// MARK: Request convenience initializers and mutators

public extension RequestDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(RequestDTO.self, from: data)
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
        query: String?? = nil,
        type: String?? = nil
    ) -> RequestDTO {
        return RequestDTO(
            query: query ?? self.query,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
