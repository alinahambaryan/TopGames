//
//  GamesViewController.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import UIKit
import APESuperHUD

class GamesViewController : BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate var topGames : [Game] = []

    override func fetchData(completion: @escaping ([AnyObject]?, Error?) -> ()) {
        DispatchQueue.global(qos: .background).async {
            NetworkingManager.fetchTopGames(limit:Constants.Games.topLimit){ [weak self](response, error) in
                if let games = response {
                    self?.topGames = games.sorted(by: {$0.popularity > $1.popularity})
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
                completion(self?.topGames as [AnyObject]?, error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameStreams" {
            let streamsViewController =  segue.destination as! StreamsViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: indexPath, animated: true)
                streamsViewController.game = topGames[indexPath.row].name
            }
        }
    }
}
extension GamesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.configure(game:self.topGames[indexPath.row])
        return cell
    }
}
