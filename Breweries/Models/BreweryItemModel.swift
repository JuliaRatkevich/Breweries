//
//  BreweryItemModel.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 07.11.22.
//

import Foundation

struct BreweryItemModel: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case state
        case type = "brewery_type"
        case website = "website_url"
       
    }
    let id: String
    let name: String
    let country: String
    let state: String?
    let type: String
    let website: String?
}


