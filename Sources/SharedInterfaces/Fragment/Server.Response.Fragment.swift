//
//  Server.Response.Fragment.swift
//
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.Response {
    
    public struct Fragment: Decodable, Equatable {
        /// The unique key of a given returned server fragment
        public let key: String
        /// Identifies which component is being returned from the server
        public let type: Server.Response.FragmentType
        
        enum CodingKeys: CodingKey {
            case key
            case type
            case content
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: Server.Response.Fragment.CodingKeys.self)
            self.key = try container.decode(String.self, forKey: Server.Response.Fragment.CodingKeys.key)
            
            guard let fragmentName = Server.Response.FragmentName(rawValue: key) else {
                throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.key],
                                                        debugDescription: "Could not parse fragment named \(key)"))
            }
            
            self.type = try Server.Response.FragmentType.decode(with: container,
                                                                name: fragmentName,
                                                                forKey: .content)
        }
    }
}
