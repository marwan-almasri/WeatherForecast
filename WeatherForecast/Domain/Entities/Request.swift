//
//  Request.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public struct Request {
    public var query: String?
    public var type: String?

    public init(query: String?,
                type: String?) {
        self.query = query
        self.type = type
    }
}
