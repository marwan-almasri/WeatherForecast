//
//  WeatherReportDTO.swift
//  Weather Forecast
//
//  Created by Marwan on 6/30/21.
//

import Foundation

// MARK: - Report
public struct ReportDTO {
    public var currentCondition: [ConditionDTO]?
    public var nearestArea: [AreaDTO]?
    public var request: [RequestDTO]?
    public var weather: [WeatherDTO]?

    public init(currentCondition: [ConditionDTO]?,
                nearestArea: [AreaDTO]?,
                request: [RequestDTO]?,
                weather: [WeatherDTO]?) {
        self.currentCondition = currentCondition
        self.nearestArea = nearestArea
        self.request = request
        self.weather = weather
    }
}

extension ReportDTO {
    func toDomain() -> Report {
        return Report(currentCondition: currentCondition?.map { $0.toDomain() },
                      nearestArea: nearestArea?.map { $0.toDomain() },
                      request: request?.map { $0.toDomain() },
                      weather: weather?.map { $0.toDomain() })
    }
}

extension ReportDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case currentCondition = "current_condition"
        case nearestArea = "nearest_area"
        case request = "request"
        case weather = "weather"
    }
}

// MARK: Report convenience initializers and mutators

public extension ReportDTO {
    init(data: Data) throws {
        self = try JSONSchemaSupport.decoder().decode(ReportDTO.self, from: data)
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
        currentCondition: [ConditionDTO]?? = nil,
        nearestArea: [AreaDTO]?? = nil,
        request: [RequestDTO]?? = nil,
        weather: [WeatherDTO]?? = nil
    ) -> ReportDTO {
        return ReportDTO(
            currentCondition: currentCondition ?? self.currentCondition,
            nearestArea: nearestArea ?? self.nearestArea,
            request: request ?? self.request,
            weather: weather ?? self.weather
        )
    }

    func jsonData() throws -> Data {
        return try JSONSchemaSupport.encoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
