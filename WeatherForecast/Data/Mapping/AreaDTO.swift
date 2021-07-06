//
//  AreaDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

// MARK: - AreaDTO
public struct AreaDTO {
    public var areaName: [DescriptionDTO]?
    public var country: [DescriptionDTO]?
    public var latitude: String?
    public var longitude: String?
    public var population: String?
    public var region: [DescriptionDTO]?
    public var weatherURL: [DescriptionDTO]?

    public init(areaName: [DescriptionDTO]?,
                country: [DescriptionDTO]?,
                latitude: String?,
                longitude: String?,
                population: String?,
                region: [DescriptionDTO]?,
                weatherURL: [DescriptionDTO]?) {
        self.areaName = areaName
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.population = population
        self.region = region
        self.weatherURL = weatherURL
    }
}

extension AreaDTO {
    func toDomain() -> Area {
        return Area(areaName: areaName?.map { $0.toDomain() },
                    country: country?.map { $0.toDomain() },
                    latitude: latitude,
                    longitude: longitude,
                    population: population,
                    region: region?.map { $0.toDomain() },
                    weatherURL: weatherURL?.map { $0.toDomain() })
    }
}

extension AreaDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case areaName = "areaName"
        case country = "country"
        case latitude = "latitude"
        case longitude = "longitude"
        case population = "population"
        case region = "region"
        case weatherURL = "weatherUrl"
    }
}

// MARK: NearestArea convenience initializers and mutators

public extension AreaDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(AreaDTO.self, from: data)
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
        areaName: [DescriptionDTO]?? = nil,
        country: [DescriptionDTO]?? = nil,
        latitude: String?? = nil,
        longitude: String?? = nil,
        population: String?? = nil,
        region: [DescriptionDTO]?? = nil,
        weatherURL: [DescriptionDTO]?? = nil
    ) -> AreaDTO {
        return AreaDTO(
            areaName: areaName ?? self.areaName,
            country: country ?? self.country,
            latitude: latitude ?? self.latitude,
            longitude: longitude ?? self.longitude,
            population: population ?? self.population,
            region: region ?? self.region,
            weatherURL: weatherURL ?? self.weatherURL
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
