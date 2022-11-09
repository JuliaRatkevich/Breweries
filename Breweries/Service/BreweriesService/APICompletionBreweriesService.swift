//
//  APIBreweriesService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import Foundation
import Combine

final class APIBreweriesService: BreweriesService {
    private let session: URLSession = URLSession.shared
    
    // 1. using completion handlers
    func fetch(_ completion: @escaping (Result<[Brewery], BreweriesServiceError>) -> Void) {
        // create URL
        // using string
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            completion(.failure(BreweriesServiceError.invalidURL))
            return
        }
        
//        // using URL components
//        var components = URLComponents(string: "api.openbrewerydb.org")
//        components?.scheme = "HTTPS"
//        components?.path = "breweries"
//
//        let url = components?.url
        
//        // add query params if needed
//        let queryItems: [URLQueryItem] = [
//            URLQueryItem(name: "query", value: "BrewingDog"),
//            URLQueryItem(name: "apiKey", value: "123adf&ads3@#@#sadfa"),
//            URLQueryItem(name: "status", value: "available")
//        ]
//        var components = URLComponents(string: "https://api.openbrewerydb.org/breweries")
//        components?.queryItems = queryItems
//        let url = components?.url
        
        // 1. Get data (network, DB, local, fake, etc.)
        // use DataTask
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(BreweriesServiceError.unknown))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(.failure(BreweriesServiceError.statusCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(BreweriesServiceError.missingData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let breweries = try decoder.decode([Brewery].self, from: data)
                // 2. "Notify"/give back to caller/customer by calling completion -> REQUIRED and only ONCE!
                completion(.success(breweries))
            } catch {
                completion(.failure(BreweriesServiceError.invalidData))
            }
            
        }
        
        dataTask.resume()
    }
    
    
    
    func load() async throws -> [Brewery] {
        return []
    }
    
    
    
    func fetch() -> AnyPublisher<[Brewery], BreweriesServiceError> {
        return Array<[Brewery]>().publisher.setFailureType(to: BreweriesServiceError.self).eraseToAnyPublisher()
    }
}

//struct A {
//    func test() {
//        completion(result: .success([]))
//    }
//
//    func completion(result: Result<[Brewery], Error>) -> Void {
//
//    }
//}

