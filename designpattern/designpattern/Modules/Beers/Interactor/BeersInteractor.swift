//
//  BeersInteractor.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

class BeersInteractor: IGenericInteractor {
    var output: IGenericInteractorOutput!
    
    func fetchItems(_ amountPerPage: Int?, _ pageNumber: Int?) {
        // Neste método pegamos dados da API para enviar pra tela.
        
        Api.sharedInstance.request(url: Endpoint.forUrl(.beersList), method: RequestType.GET, with: nil, onSuccess: { [weak self] (beers: [Beer]) in
            // Caso a api retorne os dados com sucesso enviamos pro output os items
            self?.output.itemsFetched(beers)
        }) { [weak self] (errorMessage) in
            // Caso aconteça alguma falha, vamos enviar pro output a informação de falha
             self?.output.itemsFetchFailed()
            print(errorMessage)
        }
        
        // Para este exemplo vou enviar um array criado na mão
//        var beers: [Beer] = []
//
//        let heineken: Beer = Beer(image: "", name: "Heineken", tagline: "A melhor cerveja do Brasil", beerDescription: "")
//        beers.append(heineken)
//
//        let leffe: Beer = Beer(image: "", name: "Leffe", tagline: "Tradição holandesa presente na sua vida há quase 100 anos", beerDescription: "")
//        beers.append(leffe)
        
        
        
    }
}
