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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var nextEvoLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexIdLabel.text = "\(pokemon.pokedexId)"
        currentEvoImage.image = UIImage(named: "\(pokemon.pokedexId)")
        descriptionLabel.text = "Loading..."
        typeLabel.text = "Loading..."
        defenseLabel.text = "Loading..."
        heightLabel.text = "Loading..."
        weightLabel.text = "Loading..."
        attackLabel.text = "Loading..."
        nextEvoLabel.text = "Loading..."
        
        pokemon.downloadPokemonDetails {
            // Whatever we put here will only be executed after the download is completed.
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.typeLabel.text = pokemon.type
        self.defenseLabel.text = pokemon.defense
        self.heightLabel.text = pokemon.height
        self.weightLabel.text = pokemon.weight
        self.attackLabel.text = pokemon.attack
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
