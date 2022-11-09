//
//  BreweryItemService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import Foundation
import Combine

enum BreweryItemServiceError: Error {
    case invalidURL
    case statusCode
    case missingData
    case invalidData
    case unknown
}

protocol  BreweryItemService {
    
    func fetch(id: String) -> AnyPublisher<BreweryItemModel, BreweryItemServiceError>
    
}

