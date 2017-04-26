//
//  DataSource.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Alamofire
import Argo
import Runes

class DataSource{
    
    static func fetchTopGames(limit:Int, completionHandler: @escaping ([Game]?, Error?) -> ()){
        let urlString = "https://api.twitch.tv/kraken/games/top?limit=" + String(limit)
        var request = URLRequest(url: URL(string: urlString)!)
        request.allHTTPHeaderFields = ["Client-ID":"lb715ejwkdwk9b9ljrtowl1nj595kf8"]
        request.httpMethod = "GET"
        
        Alamofire.request(request).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let j: Any = response.result.value {
                    let decodedResponse: Decoded<GameResponse> = decode(j)
                    completionHandler(decodedResponse.value?.games, decodedResponse.error)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, error)
            }
        }
    }
    
    static func fetchStreamForGame(name:String, completionHandler: @escaping ([Stream]?, Error?) -> ()){
        let urlString = "https://api.twitch.tv/kraken/streams?game=" + name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var request = URLRequest(url: URL(string: urlString)!)
        request.allHTTPHeaderFields = ["Client-ID":"lb715ejwkdwk9b9ljrtowl1nj595kf8"]
        request.httpMethod = "GET"
        
        Alamofire.request(request).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let j: Any = response.result.value {
                    let decodedResponse: Decoded<StreamResponse> = decode(j)
                    completionHandler(decodedResponse.value?.streams, decodedResponse.error)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, error)
            }
        }
    }
}
