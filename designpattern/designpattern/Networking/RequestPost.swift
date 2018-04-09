//
//  RequestPost.swift
//  designpattern
//
//  Created by Jeferson Nazario on 16/03/18.
//  Copyright © 2018 jnazario.com. All rights reserved.
//

import Foundation

struct RequestPost {
    /// Post function: makes a post on the API endpoint parsing body params
    ///
    /// - Parameters:
    ///   - url: Url address for the API endpoint
    ///   - bodyParams: *Optional - all parameters used on the body on the API endpoint
    /// - Returns: URLRequest object
    static func create(_ url: String, with bodyParams: [String: AnyObject]?) -> URLRequest? {
        guard let urlRequest: URL = URL(string: url) else { return nil }
        var request: URLRequest = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        var postStringParams = ""
        if let params = bodyParams {
            for param in params {
                postStringParams += "&\(param.key)=\(param.value)"
            }
            postStringParams = postStringParams.replacingOccurrences(of: "&", with: "", range:postStringParams.range(of: "&"))
        }
        request.httpBody = postStringParams.data(using: .utf8)
        request.setValue("Bearer \("MY_BEARER_TOKEN_HERE")", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
