//
//  BreweriesApp.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import SwiftUI

@main
struct BreweriesApp: App {
    @StateObject private var breweriesViewModel = BreweriesListViewModel(service: APIListService())
    var body: some Scene {
        WindowGroup {
            BreweriesView(viewModel: breweriesViewModel)
        }
    }
}
