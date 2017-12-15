//
//  RootRouter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

class RootRouter: IGenericRouter {
    var viewController: UIViewController?
    var beersRouter: IGenericRouter!
    
    required init() {
        beersRouter = BeersRouter()
    }
    
    func present<T>(forItem item: T) {
        
    }
    
    func assembleModule() -> UIViewController {
        return beersRouter.assembleModule()
    }
}
