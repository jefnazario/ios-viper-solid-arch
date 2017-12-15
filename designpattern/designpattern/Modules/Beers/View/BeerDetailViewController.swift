//
//  BeerDetailViewController.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    var presenter: BeerDetailPresenter!
    var beer: Beer?
    
    @IBOutlet var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let beer = beer {
            lblName.text = beer.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
