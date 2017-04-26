//
//  Game.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct Game {
    public let viewers: Int
    public let popularity: Int
    public let name: String
    public let imageURL: String
    
}
extension Game: Decodable {
    public static func decode(_ j: JSON) -> Decoded<Game> {
        return curry(Game.init)
            <^> j <| "viewers"
            <*> j <| ["game","popularity"]
            <*> j <| ["game","name"]
            <*> j <| ["game","box","medium"]
    }
}
