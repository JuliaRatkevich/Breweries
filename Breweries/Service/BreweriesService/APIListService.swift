//
//  APIListService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import Foundation

final class APIListService: BreweriesService {
    func load() async throws -> [Brewery] {
        // create URL from string
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            throw BreweriesServiceError.invalidURL
        }
        
        // ask server
        let result = try await URLSession.shared.data(from: url)
        
        // check response status code
        guard let httpResponse = result.1 as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw BreweriesServiceError.statusCode
        }
        
        // decode data (JSON) into model
        let decoder = JSONDecoder()
        let breweries = try decoder.decode([Brewery].self, from: result.0)
        
        return breweries
    }
}
