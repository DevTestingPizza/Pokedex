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
    @IBOutlet weak var thumbImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(pokemon.pokedexId)")
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
