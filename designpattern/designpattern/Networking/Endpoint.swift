//
//  Endpoint.swift
//  designpattern
//
//  Created by Jeferson Nazario on 16/03/18.
//  Copyright © 2018 jnazario.com. All rights reserved.
//

enum Endpoint: String {
    case login = "/signin"
    case logout = "/signout"
    case beersList = "message.ssp/beers/"
}

extension Endpoint {
    private static let base: String = "http://jefnazario.site.swiftengine.net/"
    
    static func forUrl(_ destination: Endpoint) -> String {
        return "\(base)\(destination.rawValue)"
    }
}
