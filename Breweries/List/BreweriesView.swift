//
//  BreweriesView.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import SwiftUI

struct BreweriesView: View {
    
    @ObservedObject private var viewModel: BreweriesListViewModel
    init(viewModel: BreweriesListViewModel) {
        self.viewModel = viewModel
    }
   
    var body: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()
        case .loaded(let breweries):
            
            NavigationView {
                List(breweries/*, id: \.id*/) { brewery in
                    NavigationLink {
                        let viewModel = BreweryItemViewModel(breweryId: brewery.id, service: APICombineBreweryItemService())
                        BreweryDetailView(viewModel: viewModel)
                    } label: {
                        BreweryRowView(brewery: brewery)
                    }
//                    NavigationLink(<#LocalizedStringKey#>) {
                        
//                        //                    BreweryDetailView(brewery: brewery)
//                        //                              } label: {
//                        //                                  BreweryDetailView(brewery: )
//                        //                              }
//                        //
//                    }
                }
                .navigationTitle("Breweries")
                .padding()
                .listStyle(.plain)
            }
        case .failure:
            FailureView()
        }
    }
    
//    var loadingView: some View {
//        VStack {
//            ProgressView()
//        }
//    }
//
//    var failureView: some View {
//        VStack(spacing: 20) {
//            Text("❌")
//            Text("Something went wrong")
//        }
//
//    }
    
}









struct BreweriesView_Previews: PreviewProvider {
    static var previews: some View {
        let view = BreweriesView(viewModel: BreweriesListViewModel(service: FakeBreweriesService()))
        return view
    }
}
