//
//  StreamResponse.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct StreamResponse {
    public let streams:[Stream]
}
extension StreamResponse: Decodable {
    public static func decode(_ j: JSON) -> Decoded<StreamResponse> {
        return curry(StreamResponse.init)
            <^> j <|| "streams"
    }
}
