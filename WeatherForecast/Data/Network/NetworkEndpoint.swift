//
//  NetworkEndpoint.swift
//  WeatherForecast
//
//  Created by Marwan on 7/1/21.
//

import Foundation
import Alamofire

public enum NetworkEndpoint: NetworkRequest {
    
    case weatherReport(_ city: String? = nil, unit: Unit = .metric)
    
    public var path: String {
        switch self {
        case .weatherReport(let city, _):
            guard let city = city else { return "" }
            return city
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .weatherReport(_, let unit):
            return [
                unit.rawValue: "",
                "format": "j1"
            ]
        }
    }
}
