//
//  ApiConfiguration.swift
//  TestDog
//
//  Created by Saint Germain, Geoffrey on 29/10/2024.
//

import Foundation

struct ApiConfiguration {
    let apiKey: String = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        return apiKey
    }()
    
    let baseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseUrl") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
