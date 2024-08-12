//
//  Server.DTO.Container.swift
//
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.DTO {
    
    public struct Container: Decodable, Equatable {
        /// The name of a recieved server driven container
        public let name: String
        /// A collection of raw fragments to display to the UI
        public let fragments: [Server.DTO.Fragment]
        
        enum CodingKeys: CodingKey {
            case name
            case fragments
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: Server.DTO.Container.CodingKeys.self)
            self.name = try container.decode(String.self, forKey: Server.DTO.Container.CodingKeys.name)
            self.fragments = try container.decode([Server.DTO.Fragment].self, forKey: Server.DTO.Container.CodingKeys.fragments)
        }
    }
}
