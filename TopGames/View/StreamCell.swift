//
//  StreamCell.swift
//  TopGames
//
//  Created by ALINA HAMBARYAN on 4/26/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//


import UIKit
import AlamofireImage

class StreamCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var viewerCountLabel: UILabel!
    
    func configureCell(stream:Stream) {
        self.titleLabel.text = stream.name
        self.viewerCountLabel.text = String(stream.viewers)
        
        let url = URL(string: stream.imageURL)!
        
        let placeholderImage = UIImage(named: "placeholder")!
        
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: self.pictureImageView.frame.size,
            radius: 10.0
        )
        
        self.pictureImageView.af_setImage(
            withURL: url,
            placeholderImage: placeholderImage,
            filter: filter,
            imageTransition: .crossDissolve(0.2)
        )
    }
}
