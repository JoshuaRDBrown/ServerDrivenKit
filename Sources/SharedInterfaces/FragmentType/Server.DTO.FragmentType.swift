//
//  Server.DTO.FragmentType.swift
//
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.DTO {
    
    /// Stores the type and the fragment data itself
    public enum FragmentType: Decodable, Equatable {
        case exampleFragment(dto: Server.DTO.ExampleFragment)
    }
}

extension Server.DTO.FragmentType {
    
    static func decode<Key>(
        with container: KeyedDecodingContainer<Key>,
        name: Server.DTO.FragmentName,
        forKey key: Key
    ) throws -> Self {
        switch name {
        case .exampleFragment:
            let dto = try container.decode(Server.DTO.ExampleFragment.self, forKey: key)
            return .exampleFragment(dto: dto)
        }
    }
}
