//
//  BreweryItemView.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import SwiftUI

struct BreweryDetailView: View {
    
//    let brewery: BreweryItemModel
    
    
    @ObservedObject var viewModel: BreweryItemViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()
        case .loaded(let brewery):
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(brewery.name)
                        .font(.title)

                    Divider()

                    Text("\(brewery.country) \(brewery.state ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                }
                Spacer()
                Text(brewery.type)
//                Text("\(brewery.website ?? "")") ->
                if let websiteURL = brewery.website,
                   let url = URL(string: websiteURL) {
                    Link("Visit our website",
                         destination: url)
                }
            }
            .padding()
          
        case .failure:
            FailureView()
        }
    }
}



//struct BreweryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreweryDetailView()
//    }
//}
