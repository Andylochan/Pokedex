//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Andy Lochan on 6/19/21.
//

import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {
    
    let vcMethods = ViewController()
    var pokemon = Pokemon(
        id: 25, name: "pikachu", weight: 60, height: 4,
        sprites: Sprites(
            frontDefault: (URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png") ?? URL(string: ""))!
        )
    )
    
    func testConversionWeight() {
        let before = pokemon.weight ?? 0
        let after = vcMethods.convertToPounds(grams: before)
        XCTAssertEqual(String(after), "13")
    }
    
    func testConversionHeight() {
        let before = pokemon.height ?? 0
        let after = vcMethods.convertToFeet(cm: before)
        XCTAssertEqual(after, "1'3")
    }
}
