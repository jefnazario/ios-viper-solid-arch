//
//  IGenericView.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import UIKit

protocol IGenericView: IProgressView {
    func showEmptyScreen()
    func showItems<T>(_ data: T)
}
