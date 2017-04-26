//
//  TopGameResponse.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct GameResponse {
    public let games:[Game]
}
extension GameResponse: Decodable {
    public static func decode(_ j: JSON) -> Decoded<GameResponse> {
        return curry(GameResponse.init)
            <^> j <|| "top"
    }
}
