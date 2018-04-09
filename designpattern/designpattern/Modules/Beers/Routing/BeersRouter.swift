//
//  BeersRouter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit
import Rswift

class BeersRouter: IGenericRouter {
    var viewController: UIViewController?
    var detailRouter = BeerDetailRouter()
    
    func present<T>(forItem item: T) {
        let detail = detailRouter.assembleModule() as! BeerDetailViewController
        detail.beer = item as? Beer
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
    
    func assembleModule() -> UIViewController {
        let view = StoryboardFactory.instantiate(name: R.storyboard.beersStoryboard.name) as! BeersTableViewController
        let presenter = BeersPresenter()
        let interactor = BeersInteractor()
        let router = BeersRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
    
    
}
