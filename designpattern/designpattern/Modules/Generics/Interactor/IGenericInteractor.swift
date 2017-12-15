//
//  IGenericInteractor.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

protocol IGenericInteractor: class {
    var output: IGenericInteractorOutput! { get set }
    func fetchItems(_ amountPerPage: Int?, _ pageNumber: Int?)
}
