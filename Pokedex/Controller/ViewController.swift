//
//  ViewController.swift
//  Pokedex
//
//  Created by Andy Lochan on 6/19/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var resLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        fetchData(query: searchBar.text?.lowercased() ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBtn.layer.cornerRadius = 10
    }

    func fetchData(query: String) {
        DataHandler.shared.fetchPokemon(queryStr: query) { (pokemon, res)  in
            DispatchQueue.main.async {
                self.resLbl.text = (res ? "Found:" : "No Results Found")
                if let unwrappedPokemon = pokemon {
                    self.setupView(pokemon: unwrappedPokemon)
                }
            }
        }
    }
    
    func setupView(pokemon: Pokemon) {
        idLbl.text = "ID: " + String(pokemon.id)
        nameLbl.text = "Name: " + pokemon.name.uppercased()
        let weightInGrams = pokemon.weight ?? 0
        let weightInPounds = convertToPounds(grams: weightInGrams)
        weightLbl.text = "Weight: " + String(weightInPounds) + " lbs"
    }
    
    func convertToPounds(grams: Int) -> Int {
        let newMass = (Double(grams) * 100) / 454
        let roundedMass = Int(round(newMass))
        return roundedMass
    }
}
