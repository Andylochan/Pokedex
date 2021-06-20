//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Andy Lochan on 6/19/21.
//

import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {

    func testName() {
        DataHandler.shared.fetchPokemon(queryStr: "Pikachu") { (pokemon, res) in
            XCTAssertEqual(pokemon?.name, "pikachu")
        }
    }
    
    func testWeight() {
        DataHandler.shared.fetchPokemon(queryStr: "Pikachu") { (pokemon, res) in
            XCTAssertEqual(String(pokemon?.weight ?? 0), "13 lbs")
        }
    }
}
