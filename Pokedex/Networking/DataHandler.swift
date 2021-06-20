//
//  DataHandler.swift
//  Pokedex
//
//  Created by Andy Lochan on 6/19/21.
//

import Foundation

class DataHandler {
    static let shared = DataHandler()
    
    func fetchPokemon(queryStr: String, closure: @escaping (Pokemon?, Bool) -> Void) {
        
        let jsonURLString = "https://pokeapi.co/api/v2/pokemon/\(queryStr)"
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            // check res & err properly here (placeholder)
            if let error = err {
                print(error.localizedDescription)
                return
            }
            guard let httpResponse = res as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                closure(nil, false)
                return
            }
            // decode data
            guard let data = data else { return }
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                closure(pokemon, true)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}
