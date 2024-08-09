//
//  FragmentType.swift
//
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.Response {
    
    /// Stores the type and the fragment data itself
    public enum FragmentType: Decodable, Equatable {
        case exampleFragment(dto: Server.Response.ExampleFragment)
    }
}

extension Server.Response.FragmentType {
    
    static func decode<Key>(
        with container: KeyedDecodingContainer<Key>,
        name: Server.Response.FragmentName,
        forKey key: Key
    ) throws -> Self {
        switch name {
        case .exampleFragment:
            let dto = try container.decode(Server.Response.ExampleFragment.self, forKey: key)
            return .exampleFragment(dto: dto)
        }
    }
}
