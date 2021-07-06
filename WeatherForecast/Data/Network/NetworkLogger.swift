//
//  NetworkLogger.swift
//  WeatherForecast
//
//  Created by Marwan on 7/5/21.
//

import Foundation

public protocol NetworkLogger {
    func log(request: URLRequest?)
    func log<EncodableObject: Encodable>(responseObject object: EncodableObject?, response: URLResponse?)
    func log(error: Error)
}

public final class DefaultNetworkLogger: NetworkLogger {
    public init() { }

    public func log(request: URLRequest?) {
        guard let request = request else {
            printIfDebug("-------------")
            printIfDebug("NULL REQUEST")
            printIfDebug("-------------")
            return
        }
        printIfDebug("-------------")
        printIfDebug("request: \(request.url!)")
        printIfDebug("headers: \(request.allHTTPHeaderFields!)")
        printIfDebug("method: \(request.httpMethod!)")
        if let httpBody = request.httpBody, let result = ((try? JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: AnyObject]) as [String: AnyObject]??) {
            printIfDebug("body: \(String(describing: result?.pretty))")
        } else if let httpBody = request.httpBody, let resultString = String(data: httpBody, encoding: .utf8) {
            printIfDebug("body: \(String(describing: resultString))")
        }
    }

    public func log<EncodableObject: Encodable>(responseObject object: EncodableObject?, response: URLResponse?) {
        if let object = object, let json = try? JSONEncoder().encode(object) {
            printIfDebug("responseData: \(String(describing: json))")
        } else {
            printIfDebug("NULL OBJECT")
        }
        printIfDebug("-------------")
    }

    public func log(error: Error) {
        printIfDebug("\(error)")
    }
}

extension Dictionary where Key == String {
    
    /// Returns the textual representations of this object as JSON string..
    fileprivate var pretty: String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                _ = jsonString.replacingOccurrences(of: "\\n", with: "\n")
                return jsonString
            }
        } catch {
            print(error.localizedDescription)
        }
        return ""
    }
}

private func printIfDebug(_ string: String) {
    #if DEBUG
    print(string)
    #endif
}
