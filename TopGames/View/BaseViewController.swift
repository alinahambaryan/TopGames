//
//  BaseViewController.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import UIKit
import Alamofire

class BaseViewController : UIViewController {
    
    func showErrorWithMessage(title: String, message: String, actionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) {  _ in  actionHandler() }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func fetchData(){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
}
