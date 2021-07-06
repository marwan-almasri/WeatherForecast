//
//  NetworkService.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation
import Alamofire

// MARK: - NetworkError extension

public enum NetworkError: Error {
    case error(statusCode: Int)
    case notConnected
    case generic(Error)
    case notFound
}

public protocol NetworkService {
    
    func request<TransferObject: Codable>(endpoint: NetworkEndpoint,
                                          completion: @escaping (Result<TransferObject, NetworkError>) -> Void)
}

// MARK: - Implementation

public final class DefaultNetworkService {
    
    private let logger: NetworkLogger
    
    public init(logger: NetworkLogger = DefaultNetworkLogger()) {
        self.logger = logger
    }
    
    var isConnected: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

extension DefaultNetworkService: NetworkService {
    
    public func request<TransferObject: Codable>(endpoint: NetworkEndpoint,
                                                 completion: @escaping (Result<TransferObject, NetworkError>) -> Void) {
        
        guard isConnected else {
            self.logger.log(error: NetworkError.notConnected)
            completion(.failure(.notConnected))
            return
        }
        
        logger.log(request: try? endpoint.asURLRequest())
        
        AF.request(NetworkEndpoint.weatherReport()).responseDecodable(of: TransferObject.self) { response in
            if let statusCode = response.response?.statusCode,
               !(200...204).contains(statusCode) {
                let error = NetworkError.error(statusCode: statusCode)
                self.logger.log(error: error)
                completion(.failure(error))
            }
            
            if let error = response.error {
                self.logger.log(error: error)
                completion(.failure(.generic(error)))
            } else if let value = response.value {
                self.logger.log(responseObject: value, response: response.response)
                completion(.success(value))
            } else {
                let error = NetworkError.notFound
                self.logger.log(error: error)
                completion(.failure(error))
            }
        }
    }
}
