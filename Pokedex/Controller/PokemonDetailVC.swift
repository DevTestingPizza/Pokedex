//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Tom Grobbe on 27/10/2017.
//  Copyright © 2017 Tom Grobbe. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        
    }


}
