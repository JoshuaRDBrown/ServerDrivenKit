//
//  FragmentName.swift
//  
//
//  Created by Joshua Brown on 09/08/2024.
//

import Foundation

extension Server.Response {
    
    /// Raw name of the fragment as it appears on the server response
    public enum FragmentName: String, Codable {
        case exampleFragment = "exampleFragment"
    }
}
