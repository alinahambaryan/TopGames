//
//  StreamsViewController.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import UIKit
import APESuperHUD

class StreamsViewController : BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var game : String = ""
    fileprivate var streams : [Stream] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = game
    }
    
    override func fetchData(completion: @escaping ([AnyObject]?, Error?) -> ()) {
        DispatchQueue.global(qos: .background).async {
            NetworkingManager.fetchStreamForGame(name: self.game) {[weak self] (response, error) in
                if let streams = response {
                   self?.streams = Array(streams.sorted(by: {$0.viewers > $1.viewers} ).prefix(Constants.Streams.topLimit))
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
                completion(self?.streams as [AnyObject]?, error)
            }
        }
    }

}
extension StreamsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StreamCell", for: indexPath) as! StreamCell
        cell.configureCell(stream:self.streams[indexPath.row])
        return cell
    }
}
