//
//  ReportResponseStorage.swift
//  WeatherForecast
//
//  Created by Marwan on 7/1/21.
//

import Foundation

protocol ReportResponseStorage {
    func get(completion: @escaping (Result<ReportDTO?, Error>) -> Void)
    func set(_ object: ReportDTO, completion: @escaping (Result<Void, Error>) -> Void)
    func clear(completion: @escaping (Result<Void, Error>) -> Void)
}
