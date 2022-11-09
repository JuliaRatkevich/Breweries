//
//  APICombineBreweryItemService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import Foundation
import Combine

final class APICombineBreweryItemService: BreweryItemService {
    
    private let session: URLSession = URLSession.shared
    
    func fetch(id: String) -> AnyPublisher<BreweryItemModel, BreweryItemServiceError> {
        // query param:
//        URL(string: "https://api.openbrewerydb.org/breweries?id=\(id)")
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries/\(id)") else {
            return Fail(outputType: BreweryItemModel.self, failure: BreweryItemServiceError.invalidURL)
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
                    throw BreweryItemServiceError.statusCode
                }
                
                return data
            }
            .decode(type: BreweryItemModel.self, decoder: JSONDecoder())
            .mapError { error in
                return error as? BreweryItemServiceError ?? BreweryItemServiceError.unknown
            }
            .eraseToAnyPublisher()
    }
}
    


