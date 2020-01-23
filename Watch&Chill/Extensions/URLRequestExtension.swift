//
//  URLRequestExtension.swift
//  Watch&Chill
//
//  Created by Oumeima ben ghalba on 1/22/20.
//  Copyright © 2020 Oumeima ben ghalba. All rights reserved.
//

import Foundation

extension URLRequest {
    
    func curlRepresentation() {
        
        #if !DEBUG
        return
        #else
        var result = "curl -k "
        
        if let method = httpMethod {
            result += "-X \(method) \\\n"
        }
        
        if let url = url {
            result += url.absoluteString
        }
        
        if let headers = allHTTPHeaderFields {
            for (header, value) in headers {
                result += "-H \"\(header): \(value)\" \\\n"
            }
        }
        
        if let body = httpBody, !body.isEmpty, let string = String(data: body, encoding: .utf8), !string.isEmpty {
            result += "-d '\(string)' \\\n"
        }
        
        print("Request:\n", result)
        #endif
    }
}
