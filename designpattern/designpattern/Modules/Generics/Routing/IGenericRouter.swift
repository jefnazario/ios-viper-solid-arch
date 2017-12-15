//
//  IGenericRouter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

protocol IGenericRouter {
    var viewController: UIViewController? { get set }
    
    func present<T>(forItem item: T)
    func assembleModule() -> UIViewController
}
