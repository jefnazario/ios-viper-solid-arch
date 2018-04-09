//
//  Api.swift
//  designpattern
//
//  Created by Jeferson Nazario on 18/02/18.
//  Copyright © 2018 jnazario.com. All rights reserved.
//

import Foundation
import UIKit

/// Class to allow make requests to Api
class Api {
    /// Singleton instance from Api class
    static let sharedInstance = Api()
    
    /// Create and execute an async request for httMethods
    ///
    /// - Parameters:
    ///   - url: URL address that will be the destination of the request
    ///   - method: httpMethod for the request: GET, POST, PUT & DELETE
    ///   - parameters: *Optional - Request parameters
    ///   - onSuccess: Escaping success func to dispatch the result of request
    ///   - onError: Escaping error fun to dispatch the error message to the caller
    func request<T: Decodable>(url: String, method: RequestType, with parameters: [String: AnyObject]?, onSuccess: @escaping (T) -> Void, onError: @escaping (String) -> Void) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        var urlRequest: URLRequest?
        switch method {
        case .GET:
            urlRequest = RequestGet.build(url, with: parameters, or: nil)
        case .POST:
            urlRequest = RequestPost.create(url, with: parameters)
        case .PUT: break
        case .DELETE: break
        }
        
        if let myRequest = urlRequest {
            let task = session.dataTask(with: myRequest, completionHandler: { (result, response, error) in
                if error == nil {
                    guard let data = result else {
                        onError(Localized.requestGenericError.rawValue.translate())
                        return
                    }
                    
                    do {
                        let responseData: ApiResponse<T> = try JSONDecoder().decode(ApiResponse<T>.self, from: data)
                        guard let decodableData: T = responseData.data else {
                            onError(Localized.requestGenericError.rawValue.translate())
                            return
                        }
                        DispatchQueue.main.async {
                            onSuccess(decodableData)
                        }
                    } catch let ex {
                        onError(ex.localizedDescription)
                    }
                }
                
                if let hasError = error {
                    onError(hasError.localizedDescription)
                }
            })
            
            task.resume()
        } else {
            onError(Localized.requestGenericError.rawValue.translate())
        }
    }
}
