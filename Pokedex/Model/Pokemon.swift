//
//  Pokemon.swift
//  Pokedex
//
//  Created by Tom Grobbe on 27/10/2017.
//  Copyright © 2017 Tom Grobbe. All rights reserved.
//


import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoTxt: String!
    private var _nextEvoId: String!
    private var _pokemonURL: String!
    
    
    var name: String {
        return _name
    }
    var pokedexId: Int {
        return _pokedexId
    }
    var description: String {
        if _description == nil {
            _description = "Error"
        }
        return _description
    }
    var type: String {
        if _type == nil {
            _type = "Error"
        }
        return _type
    }
    var defense: String {
        if _defense == nil {
            _defense = "Error"
        }
        return _defense
    }
    var attack: String {
        if _attack == nil {
            _attack = "Error"
        }
        return _attack
    }
    var height: String {
        if _height == nil {
            _height = "Error"
        }
        return _height
    }
    var weight: String {
        if _weight == nil {
            _weight = "Error"
        }
        return _weight
    }
    var nextEvoTxt: String {
        if _nextEvoTxt == nil {
            _nextEvoTxt = "Error"
        }
        return _nextEvoTxt
    }
    var nextEvoId: String {
        if _nextEvoId == nil {
            _nextEvoId = "Error"
        }
        return _nextEvoId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name.capitalized
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        
        
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            if let dict = response.result.value as?  Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let defense = stats[3]["base_stat"] as? Int {
                        self._defense = "\(defense)"
                    }
                    if let attack = stats[4]["base_stat"] as? Int {
                        self._attack = "\(attack)"
                    }
                }
                self._type = nil
                if let types = dict["types"] as? [Dictionary<String, AnyObject>] {
                    for type in types {
                        if let type2 = type["type"] as? Dictionary<String, AnyObject> {
                            if let typeName = type2["name"] as? String {
                                if self._type == "" || self._type == nil {
                                    self._type = typeName.capitalized
                                } else {
                                    self._type = "\(self._type!)/\(typeName.capitalized)"
                                }
                            }
                        }
                    }
                }
            }
            completed()
            //print(response.result.value!)
            print(self._name, self._pokedexId, self._description, self._type, self._defense, self._weight, self._height, self._attack, self._nextEvoTxt, self._pokemonURL )
        }
    }
    
    
    
}

