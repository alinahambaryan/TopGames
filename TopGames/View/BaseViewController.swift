//
//  BaseViewController.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import UIKit
import Alamofire
import APESuperHUD

class BaseViewController : UIViewController {
    func fetchData(completion: @escaping ([AnyObject]?, Error?) -> ()){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        APESuperHUD.appearance.messageFontSize = 14
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "", presentingView: self.view)

        self.fetchData { (response, error) in
            if (error != nil) {
                APESuperHUD.showOrUpdateHUD(icon: .info, message: (error?.localizedDescription)!, particleEffectFileName: nil, presentingView: self.view, completion: {})
            }
        }
        APESuperHUD.removeHUD(animated: false, presentingView: self.view, completion: nil)
    }
}
