//
//  Server.DTO.Content.swift
//
//
//  Created by Joshua Brown on 12/08/2024.
//

import Foundation

extension Server.DTO {
    /// Representing a server driven screen
    public struct Content: Equatable, Decodable {
        
        /// A list of returned fragments to show in the UI
        public let fragments: [Server.DTO.Fragment]
        
        public init(fragments: [Server.DTO.Fragment]) {
            self.fragments = fragments
        }
    }
}
