//
//  Defines.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/27/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation


public struct Constants {
    
    public struct Games {
        public static let topLimit = 5
    }
    
    public struct Streams {
        public static let topLimit = 10
    }
    
    public struct Twitch {
        public static let header = "Client-ID"
        public static let clientID = "lb715ejwkdwk9b9ljrtowl1nj595kf8"
    }

    public struct URLs {
        public static let gamePath = "https://api.twitch.tv/kraken/games/top?limit="
        public static let streamPath = "https://api.twitch.tv/kraken/streams?game="
    }
}
