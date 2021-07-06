//
//  NetworkRequest.swift
//  WeatherForecast
//
//  Created by Marwan on 7/1/21.
//

import Foundation
import Alamofire

/**
 Types adopting the URLRequestConvertible protocol can be used to safely construct URLRequests.
 */
public protocol NetworkRequest: URLRequestConvertible {
    
    /// Returns the `String` object that represent the API base url
    /// - Attention: by setting this var you will apply the change directly to the router and api.
    var baseURL: String { get }
    
    /// Returns the `String` value that represent the sub-url for the request instance.
    /// default value is  empty string
    var path: String { get }
    
    /// Returns the `HTTPMethod` for the request instance.
    /// default value is `HTTPMethod.get`
    var method: HTTPMethod { get }
    
    /// Returns the `ParameterEncoding` for the HTTP request instance.
    /// default value is `URLEncoding.default` if the method is get otherwise `JSONEncoding.default`
    var encoding: ParameterEncoding { get }
    
    /// Returns the `Parameters` for the HTTP request instance.
    /// default value is `nil`
    var parameters: Parameters? { get }
    
    /// Returns the `HTTPHeaders` for the request instance.
    var headers: HTTPHeaders { get }
}

extension NetworkRequest {
    
    public var defaultBaseURL: String { "https://wttr.in" }
    
    public var baseURL: String { defaultBaseURL }
    
    public var path: String { "" }
    
    public var method: HTTPMethod { .get }
    
    public var encoding: ParameterEncoding {
        method == .get ? URLEncoding.default: JSONEncoding.default
    }
    
    public var parameters: Parameters? { nil }
    
    public var defaultHeaders: HTTPHeaders {
        let configuration = URLSessionConfiguration.af.default
        var headers = configuration.headers
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        return headers
    }
    
    public var headers: HTTPHeaders { defaultHeaders }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var request = try URLRequest(url: url.appendingPathComponent(path), method: method, headers: headers)
        request = try encoding.encode(request, with: parameters)
        return request
    }
}
