//
//  Request.swift
//  designpattern
//
//  Created by Jeferson Nazario on 15/03/18.
//  Copyright © 2018 jnazario.com. All rights reserved.
//

import Foundation

struct RequestGet {
    /// Identifier to use query or route format on the API
    static var isQuery: Bool = true // Get this information from a .plist file
    
    /// Get function: to generate a request for the endpoint structured as QUERY or ROUTE params
    ///
    /// - Parameters:
    ///   - url: Url address for the API endpoint
    ///          If the type of params is ROUTE the URL must be generated as we can see below:
    ///          ---> http://mydomain.com/api/endpoint/{0}/detail/{1}
    ///          So, the route will be updated according the sequence of params sent
    ///   - queryParams: *Optional - all parameters used on the query string on the API endpoint
    /// - Returns: URLRequest object
    static func build(_ url: String, with queryParams: [String: AnyObject]?, or routeParams: [String]?) -> URLRequest? {
        var fullUrl: String = url
        if isQuery {
            fullUrl += "?"
            if let query = queryParams {
                for (key, value) in query {
                    fullUrl += "\(key)=\(value)&"
                }
                fullUrl = String(describing: fullUrl.prefix(fullUrl.count - 2)) // validate if is 2 or 1
            }
        } else {
            fullUrl += "/"
            if let params = routeParams {
                for (index, param) in params.enumerated() {
                    fullUrl = fullUrl.replacingOccurrences(of: "{\(index)}", with: "\(param)/")
                }
            }
        }
        guard let urlRequest: URL = URL(string: fullUrl) else { return nil }
        var request: URLRequest = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        
        return request
    }
}
