//
//  GamesViewController.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import UIKit
import APESuperHUD

class GamesViewController:BaseViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var topGames : [Game] = []
    
    override func fetchData(){
        APESuperHUD.appearance.messageFontSize = 14
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "", presentingView: self.view)
        
        DataSource.fetchTopGames(limit:Constants.Games.topLimit) { (response, error) in
            if let games = response {
                self.topGames = games.sorted(by: {$0.popularity > $1.popularity})
                APESuperHUD.removeHUD(animated: false, presentingView: self.view, completion: {self.tableView.reloadData()})
            }
            else {
                APESuperHUD.showOrUpdateHUD(icon: .info, message: (error?.localizedDescription)!, particleEffectFileName: nil, presentingView: self.view, completion: {})
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.configure(game:self.topGames[indexPath.row])
        return cell
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
