//
//  BreweryItemViewModel.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import Foundation
import Combine

final class BreweryItemViewModel: ObservableObject {
    enum State {
        case loading
        case failure
        case loaded(BreweryItemModel)
    }
    
    private let service: BreweryItemService
    private let breweryId: String
    private var cancellable: Cancellable?
    @Published var state: State
    
    init(breweryId: String, service: BreweryItemService) {
        self.breweryId = breweryId
        self.service = service
        self.state = .loading
        loadData()
    }

    
    func loadData() {
        cancellable = service
            .fetch(id: breweryId)
            .print("Fetch events: ")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .failure:
                    self?.state = .failure
                case .finished:
                    break
                }
            } receiveValue: { [weak self] breweriItem in
                self?.state = .loaded(breweriItem)
            }
        
    }
}
