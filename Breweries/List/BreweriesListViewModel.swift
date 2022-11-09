//
//  BreweriesListViewModel.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import Foundation
import Combine

final class BreweriesListViewModel: ObservableObject {
    
    private let service: BreweriesService
    private var cancellable: Cancellable?
    @Published var state: State

    enum State {
        case loading
        case loaded([Brewery])
        case failure
        
    }
   
    
    init(service: BreweriesService) {
        self.service = service
        self.state = .loading
        loadData()
    }
    
    func loadData() {
        // async/await
        Task {
            do {
                let breweries = try await service.load()
                DispatchQueue.main.async {
                    self.state = .loaded(breweries)
                }
            } catch {
                DispatchQueue.main.async {
                    self.state = .failure
                }
            }
        }
        
        
//        // completion handler
//        service.fetch { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let breweries):
//                    self?.state = .loaded(breweries) // == State.loaded([])
//                case .failure:
//                    self?.state = .failure
//                }
//            }
//        }
        
//        // combine
//        cancellable = service
//            .fetch()
//            .print("Fetch events: ")
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] result in
//                switch result {
//                case .failure:
//                    self?.state = .failure
//                case .finished:
//                    break
//                }
//            } receiveValue: { [weak self] breweries in
//                self?.state = .loaded(breweries)
//            }
        
//
//        [1, 2, 3, 4, 5, 6]
//            .publisher
//            .sink { result in
//                switch result {
//                case .finished:
//                    print("finished")
//                case .failure:
//                    print("failure")
//                }
//            } receiveValue: { value in
//                print("Got \(value)")
//            }

        
    }
}
