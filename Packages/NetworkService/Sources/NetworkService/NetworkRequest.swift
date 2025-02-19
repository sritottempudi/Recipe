//
//  NetworkRequest.swift
//  NetworkService
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation

public struct NetworkRequest {
    let path: String
    let method: String
    let headers: [String: String]?
    let body: Data?
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    
    public init(path: String, method: String, headers: [String : String]?, body: Data?) {
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
    }
    
    public init(baseURL: String, path: String, method: String, headers: [String : String]?, body: Data?) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
    }
}
