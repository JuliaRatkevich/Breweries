//
//  BreweryItem.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 06.11.22.
//

import SwiftUI

struct BreweryRowView: View {
    let brewery: Brewery
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(brewery.name)
                
                Text("\(brewery.country) \(brewery.state ?? "")")
                
            }
            Spacer()
            Text(brewery.type)
        }
        .padding([.top,.bottom])
    }
}

struct BreweryItem_Previews: PreviewProvider {
    static var previews: some View {
        let fakeBrewery = Brewery(id: "2", name: "3", country: "afad", type: "f", state: "ASD")
        BreweryRowView(brewery: fakeBrewery)
    }
}
