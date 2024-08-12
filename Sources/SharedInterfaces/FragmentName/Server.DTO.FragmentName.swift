//
//  Server.DTO.FragmentName.swift
//
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.DTO {
    
    /// Raw name (or key) of the fragment as it appears on the server response
    public enum FragmentName: String, Codable {
        case exampleFragment = "exampleFragment"
    }
}
