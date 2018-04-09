//
//  BeerDetailRouter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit
import Rswift

class BeerDetailRouter: IGenericRouter {
    var viewController: UIViewController?
    
    func present<T>(forItem item: T) { }
    
    func assembleModule() -> UIViewController {
        let story = R.storyboard.beerDetailStoryboard()
        let detail = story.instantiateViewController(withIdentifier: R.storyboard.beerDetailStoryboard.name) as! BeerDetailViewController
        
        let presenter = BeerDetailPresenter()
        detail.presenter = presenter
        
        return detail
    }
}
