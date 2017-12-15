//
//  BeerDetailRouter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

class BeerDetailRouter: IGenericRouter {
    var viewController: UIViewController?
    
    func present<T>(forItem item: T) {
        
    }
    
    func assembleModule() -> UIViewController {
        // Lembrar de usar a biblioteca RSwift
        // let view = R.storyboard.detailsStoryboard.detailsViewController()
        let story = UIStoryboard.init(name: "BeerDetailStoryboard", bundle: nil)
        let detail = story.instantiateViewController(withIdentifier: "DetailView") as! BeerDetailViewController
        
        let presenter = BeerDetailPresenter()
        detail.presenter = presenter
        
        return detail
    }
}
