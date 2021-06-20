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
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        fetchData(query: searchBar.text?.lowercased() ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBtn.layer.cornerRadius = 10
    }

    func fetchData(query: String) {
        DataHandler.shared.fetchPokemon(queryStr: query) { (pokemon, res)  in
            let pokeObj = pokemon as Any
            print(pokeObj, res)
        }
    }
}

// MARK:-  Searchbar Delegate
extension ViewController: UISearchBarDelegate {    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
