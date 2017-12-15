//
//  Beer.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

import Foundation
import ObjectMapper

struct Beer: Mappable {
    var image: String! = ""
    var name: String! = ""
    var tagline: String! = ""
    var beerDescription: String! = ""
    
    init(image: String, name: String, tagline: String, beerDescription: String) {
        self.image = image
        self.name = name
        self.tagline = tagline
        self.beerDescription = beerDescription
    }
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        image <- map["image_url"]
        name <- map["name"]
        tagline <- map["tagline"]
        beerDescription <- map["description"]
    }
}
