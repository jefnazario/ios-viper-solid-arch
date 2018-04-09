//
//  ApiResponse.swift
//  designpattern
//
//  Created by Jeferson Nazario on 02/04/18.
//  Copyright © 2018 jnazario.com. All rights reserved.
//

struct ApiResponse<T: Decodable> {
    var data: T?
    
    init(responseData: T) {
        data = responseData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        let dataDecoded: T = try container.decode(T.self, forKey: .data)
        
        self.init(responseData: dataDecoded)
    }
}

extension ApiResponse: Decodable {
    enum MyStructKeys: String, CodingKey {
        case data = "data"
    }
}
