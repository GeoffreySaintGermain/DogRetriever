//
//  NetworkLogger.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

protocol NetworkLogger {
    func log(request: URLRequest)
    func log(responseData data: Data?, response: URLResponse?)
    func log(error: Error)
}

final class DefaultNetworkLogger: NetworkLogger {
    func log(request: URLRequest) {
        print("-------------")
        print("request: \(String(describing: request.url))")
        print("headers: \(String(describing: request.allHTTPHeaderFields))")
        print("method: \(String(describing: request.httpMethod))")
        if let httpBody = request.httpBody,
            let result = ((try? JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: AnyObject]) as [String: AnyObject]?) {
            print("body: \(String(describing: result))")
        } else if let httpBody = request.httpBody,
                    let resultString = String(data: httpBody, encoding: .utf8) {
            print("body: \(String(describing: resultString))")
        }
    }

    func log(responseData data: Data?, response: URLResponse?) {
        guard let data else {
            return
        }
        
        if let dataDict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            print("responseData: \(String(describing: dataDict))")
        }
    }

    func log(error: Error) {
        print("\(error)")
    }
}
