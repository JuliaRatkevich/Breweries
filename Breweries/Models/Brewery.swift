//
//  Brewery.swift
//  Breweries
//
//  Created by Yuliya Ratkevcih on 05.11.22.
//

import Foundation

struct Brewery: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case country
        case state
        case type = "brewery_type"
    }
    let id: String
    let name: String
    let country: String
    let type: String
    let state: String?
}
