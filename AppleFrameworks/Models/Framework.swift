//
//  Framework.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 29/03/2024.
//

import Foundation

struct Framework: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let urlString: String
    let description: String
}
