//
//  FakeBreweriesService.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import Foundation
import Combine

final class FakeBreweriesService: BreweriesService {
    func fetch(_ completion: (Result<[Brewery], BreweriesServiceError>) -> Void) {
        // 1. Get data (network, DB, local, fake, etc.)
        let breweries: [Brewery] = [
            Brewery(id: "1", name: "Pilsner", country: "Germany", type: "hed", state: nil),
            Brewery(id: "2", name: "Nono", country: "UK", type: "gg", state: "ASD"),
            Brewery(id: "3", name: "Corona", country: "Mexico", type: "asd", state: nil),
            Brewery(id: "4", name: "Heles", country: "Belgium", type: "asd", state: nil),
        ]
        
        // 2. "Notify"/give back to caller/customer
//        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + 5) {
            completion(Result.success(breweries))
//        }
        
        
//        test { value1, value2 in
//            return "value1: \(value1), value2: \(value2)"
//        }
//
//
//        test { value1, value2 in
//            return "\(value1 * value2)"
//        }
    }
    
//    private func test(closureName: (Int, Int) -> String) -> Void {
//        let result = closureName(42, 12)
//        print(result)
//    }
    
    
    
    func fetch() -> AnyPublisher<[Brewery], BreweriesServiceError> {
        let breweries: [Brewery] = [
            Brewery(id: "1", name: "Pilsner", country: "Germany", type: "hed", state: nil),
            Brewery(id: "2", name: "Nono", country: "UK", type: "gg", state: "ASD"),
            Brewery(id: "3", name: "Corona", country: "Mexico", type: "asd", state: nil),
            Brewery(id: "4", name: "Heles", country: "Belgium", type: "asd", state: nil),
        ]
        
        return Just(breweries)
            .setFailureType(to: BreweriesServiceError.self)
            .eraseToAnyPublisher()
    }
    
    func load() async throws -> [Brewery] {
        return []
    }
}
