//
//  NetworkRequest.swift
//
//
//  Created by Joshua Brown on 12/08/2024.
//

import Foundation

public struct NetworkRequest {
    
    @frozen public enum HTTPVerb: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    public var httpVerb: HTTPVerb = .get
    public var url: URL
    public var headers: [String: String] = [:]
    public var body: Data?
    public var queryParams: [URLQueryItem] = []
    public var cachePolicy: URLRequest.CachePolicy? = nil
    
    public init(httpVerb: HTTPVerb = .get,
                url: URL,
                headers: [String: String] = [:],
                body: Data? = nil,
                queryParams: [URLQueryItem] = [],
                cachePolicy: URLRequest.CachePolicy? = nil) {
        self.httpVerb = httpVerb
        self.url = url
        self.headers = headers
        self.body = body
        self.queryParams = queryParams
        self.cachePolicy = cachePolicy
    }
}
