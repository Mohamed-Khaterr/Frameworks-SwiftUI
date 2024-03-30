//
//  FrameworkViewModel.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 30/03/2024.
//

import Foundation

final class FrameworkViewModel: ObservableObject {
    @Published var isShowDetails = false
    
    let frameworks: [Framework] = MockData.frameworks
    
    var selectedFramework: Framework? {
        didSet {
            isShowDetails = (selectedFramework != nil)
        }
    }
}
