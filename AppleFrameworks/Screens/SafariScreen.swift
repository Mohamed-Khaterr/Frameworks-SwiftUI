//
//  SafariScreen.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 29/03/2024.
//

import SwiftUI
import SafariServices

struct SafariScreen: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}

#Preview {
    SafariScreen(url: URL(string: MockData.sampleFramework.urlString)!)
}
