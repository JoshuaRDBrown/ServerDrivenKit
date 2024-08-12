//
//  ExampleFragment.swift
//  
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.DTO {
    
    public struct ExampleFragment: Equatable, Decodable {
        
        public let title: String
        public let subtitle: String
        
        public init(title: String, subtitle: String) {
            self.title = title
            self.subtitle = subtitle
        }
    }
}
