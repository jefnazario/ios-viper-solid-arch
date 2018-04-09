//
//  Beer.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/12/17.
//  Copyright © 2017 jnazario.com. All rights reserved.
//

struct Beer {
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        let imageUrl: String = try container.decode(String.self, forKey: .image)
        let name: String = try container.decode(String.self, forKey: .name)
        let tagline: String = try container.decode(String.self, forKey: .tagline)
        let description: String = try container.decode(String.self, forKey: .beerDescription)
        
        self.init(image: imageUrl, name: name, tagline: tagline, beerDescription: description)
    }
}

extension Beer: Decodable {
    enum MyStructKeys: String, CodingKey {
        case image = "image"
        case name = "name"
        case tagline = "topic"
        case beerDescription = "description"
    }
}
