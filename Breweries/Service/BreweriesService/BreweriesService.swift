//
//  BreweriesService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import Foundation
import Combine

enum BreweriesServiceError: Error {
    case invalidURL
    case statusCode
    case missingData
    case invalidData
    case unknown
}

protocol BreweriesService {
//    // 1. using completion handlers
//    func fetch(_ completion: @escaping (Result<[Brewery], BreweriesServiceError>) -> Void)
//
//    // 2. using Combine
//    func fetch() -> AnyPublisher<[Brewery], BreweriesServiceError>
    

    // 3. using async/await
    func load() async throws -> [Brewery]
}
