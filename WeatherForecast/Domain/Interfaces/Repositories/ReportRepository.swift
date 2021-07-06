//
//  ReportRepository.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

protocol ReportRepository {
    
    func fetch(for city: String?, in unit: Unit,
               cached: @escaping (Report?) -> Void,
               completion: @escaping (Result<Report, Error>) -> Void)
}
