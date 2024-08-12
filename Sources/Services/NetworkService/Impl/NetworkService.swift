//
//  NetworkService.swift
//
//
//  Created by Joshua Brown on 12/08/2024.
//

import Foundation

final class NetworkService: NetworkServicing {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func buildRequest(httpVerb: NetworkRequest.HTTPVerb = .get,
                      url: URL,
                      headers: [String: String] = [:],
                      body: Data? = nil,
                      queryParams: [URLQueryItem] = [],
                      cachePolicy: URLRequest.CachePolicy? = nil) -> URLRequest {
        
        var urlRequest: URLRequest
        
        if let cachePolicy {
            urlRequest = URLRequest(url: url, cachePolicy: cachePolicy)
        } else {
            urlRequest = URLRequest(url: url)
        }
        
        urlRequest.httpMethod = httpVerb.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        urlRequest.url?.append(queryItems: queryParams)
        
        return urlRequest
    }
    
    func makeRequest(httpVerb: NetworkRequest.HTTPVerb = .get,
                     url: URL,
                     headers: [String: String] = [:],
                     body: Data? = nil,
                     queryParams: [URLQueryItem] = [],
                     cachePolicy: URLRequest.CachePolicy? = nil) async throws -> Server.Response {
        
        let urlRequest = buildRequest(httpVerb: httpVerb,
                                      url: url, 
                                      headers: headers,
                                      body: body,
                                      queryParams: queryParams,
                                      cachePolicy: cachePolicy)
        
        do {
            let (data, _) = try await urlSession.data(for: urlRequest)
            
            return try decode(from: data)
        } catch {
            throw error
        }
    }
    
    func decode(from data: Data) throws -> Server.Response {
        do {
            return try JSONDecoder().decode(Server.Response.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}

extension NetworkService {
    
    @frozen public enum NetworkError: Error {
        case decodingError
    }
}
