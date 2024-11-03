//
//  NetworkError.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

enum NetworkError: Error {
    case error(statusCode: Int, message: String?)
    case malformedURL
    case malformedQuerry
    case noData
}
