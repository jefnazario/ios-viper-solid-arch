//
//  BeerDetailViewController.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit
import Kingfisher

class BeerDetailViewController: UIViewController {

    var presenter: BeerDetailPresenter!
    var beer: Beer?
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet weak var imgBeer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let beer = beer {
            lblName.text = beer.name
            if let url: URL = URL(string: beer.image) {
                imgBeer.kf.setImage(with: url)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
