//
//  IGenericPresenter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

protocol IGenericPresenter: class {
    var view: IGenericView? { get set }
    var interactor: IGenericInteractor! { get set }
    var router: IGenericRouter! { get set }
    
    func viewDidLoad()
    func didSelectItem<TModel>(_ item: TModel)
}
