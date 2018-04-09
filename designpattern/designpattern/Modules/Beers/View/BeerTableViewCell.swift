//
//  BeerTableViewCell.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTagline: UILabel!
    @IBOutlet weak var imgBeer: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(beer: Beer) {
        lblName.text = beer.name
        lblTagline.text = beer.beerDescription
        
        if let url: URL = URL(string: beer.image) {
            imgBeer.kf.setImage(with: url)
        }
    }
}
