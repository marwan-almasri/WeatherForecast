//
//  DefaultReportRepository.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation
import Alamofire

enum ReportRepositoryError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case generic(Error)
    case notFound
}

final class DefaultReportRepository {
    
    private let network: NetworkService
    
    private let cache: ReportResponseStorage
    
    init(network: NetworkService,
         cache: ReportResponseStorage) {
        self.network = network
        self.cache = cache
    }
}

extension DefaultReportRepository: ReportRepository {
    func fetch(for city: String?, in unit: Unit,
               cached: @escaping (Report?) -> Void,
               completion: @escaping (Result<Report, Error>) -> Void) {
        
        self.cache.get { result in
            switch result {
            case .success(let report):
                cached(report?.toDomain())
            default: break
            }
        }
        
        let endpoint = NetworkEndpoint.weatherReport(city, unit: unit)
        network.request(endpoint: endpoint) { (result: Result<ReportDTO, NetworkError>) in
            switch result {
            case .success(let report):
                self.cache.set(report, completion: { _ in})
                completion(.success(report.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
