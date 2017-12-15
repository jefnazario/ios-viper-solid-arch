//
//  GenericPresenter.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

class GenericPresenter<T>: IGenericPresenter {
    var view: IGenericView?
    var interactor: IGenericInteractor!
    var router: IGenericRouter!
    
    private let amountPerPage = 20
    private let pageNumber = 1
    
    func viewDidLoad() {
        interactor.fetchItems(amountPerPage, pageNumber)
        view?.showProgress()
    }
    
    func didSelectItem<TModel>(_ item: TModel) {
        router.present(forItem: item)
    }
}

extension GenericPresenter: IGenericInteractorOutput {
    func itemsFetched<T>(_ items: T) {
        view?.showItems(items)
        view?.hideProgress()
    }
    
    func itemsFetchFailed() {
        view?.showEmptyScreen()
        view?.hideProgress()
    }
}
