//
//  Pokemon.swift
//  Pokedex
//
//  Created by Andy Lochan on 6/19/21.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let weight: Int?
    let height: Int? 
    let sprites: Sprites
}

struct Sprites: Decodable {
    let frontDefault: URL
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
