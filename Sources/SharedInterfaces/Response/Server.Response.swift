//
//  Server.Response.swift
//
//
//  Created by Joshua Brown on 12/08/2024.
//

import Foundation

extension Server {
    
    public struct Response: Equatable, Decodable {
        
        /// Contains a list of all the returns fragments from the server
        public let content: Server.DTO.Content
        
        public enum CodingKeys: CodingKey {
            case content
            case fragments
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: Server.Response.CodingKeys.self)
            let fragments = try container.decode([Server.DTO.Fragment].self, forKey: .fragments)
            self.content = Server.DTO.Content(fragments: fragments)
        }
        
        public init(content: Server.DTO.Content) {
            self.content = content
        }
    }
}
