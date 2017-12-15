//
//  IGenericInteractorOutput.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

protocol IGenericInteractorOutput: class {
    func itemsFetched<T>(_ items: T)
    func itemsFetchFailed()
}
