//
//  AstronomyDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

public struct AstronomyDTO {
    public var moonIllumination: String?
    public var moonPhase: String?
    public var moonrise: String?
    public var moonset: String?
    public var sunrise: String?
    public var sunset: String?

    public init(moonIllumination: String?,
                moonPhase: String?,
                moonrise: String?,
                moonset: String?,
                sunrise: String?,
                sunset: String?) {
        self.moonIllumination = moonIllumination
        self.moonPhase = moonPhase
        self.moonrise = moonrise
        self.moonset = moonset
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

extension AstronomyDTO {
    
    func toDomain() -> Astronomy {
        return Astronomy(moonIllumination: moonIllumination,
                         moonPhase: moonPhase,
                         moonrise: moonrise,
                         moonset: moonset,
                         sunrise: sunrise,
                         sunset: sunset)
    }
}

extension AstronomyDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case moonIllumination = "moon_illumination"
        case moonPhase = "moon_phase"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

// MARK: Astronomy convenience initializers and mutators

public extension AstronomyDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(AstronomyDTO.self, from: data)
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
        moonIllumination: String?? = nil,
        moonPhase: String?? = nil,
        moonrise: String?? = nil,
        moonset: String?? = nil,
        sunrise: String?? = nil,
        sunset: String?? = nil
    ) -> AstronomyDTO {
        return AstronomyDTO(
            moonIllumination: moonIllumination ?? self.moonIllumination,
            moonPhase: moonPhase ?? self.moonPhase,
            moonrise: moonrise ?? self.moonrise,
            moonset: moonset ?? self.moonset,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
