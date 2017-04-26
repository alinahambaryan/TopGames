//
//  Stream.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//


import Foundation
import Argo
import Curry
import Runes

public struct Stream {
    public let viewers: Int
    public let imageURL: String
    public let name: String
}
extension Stream: Decodable {
    public static func decode(_ j: JSON) -> Decoded<Stream> {
        return curry(Stream.init)
            <^> j <| "viewers"
            <*> j <| ["preview","medium"]
            <*> j <| ["channel","name"]
    }
}
