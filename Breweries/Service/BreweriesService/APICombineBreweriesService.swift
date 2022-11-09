//
//  APICombineBreweriesService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 06.11.22.
//

import Foundation
import Combine

final class APICombineBreweriesService: BreweriesService {
    private let session: URLSession = URLSession.shared
    
    func fetch() -> AnyPublisher<[Brewery], BreweriesServiceError> {
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            return Fail(outputType: [Brewery].self, failure: BreweriesServiceError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: url)
        // no status code check
//            .map { data, response in
//                return data
//            }
        // check status code == 200
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw BreweriesServiceError.statusCode
                }
                
                return data
            }
            .decode(type: [Brewery].self, decoder: JSONDecoder())
            .mapError { error in
                return error as? BreweriesServiceError ?? BreweriesServiceError.unknown
            }
            .eraseToAnyPublisher()
    }
    
    
    func fetch(_ completion: @escaping (Result<[Brewery], BreweriesServiceError>) -> Void) {
        
    }
    
    func load() async throws -> [Brewery] {
        return []
    }
}
