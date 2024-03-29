//
//  FrameworksGridView.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 29/03/2024.
//

import SwiftUI

struct FrameworksGridView: View {
    
    private let frameworks: [Framework] = MockData.frameworks
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    FrameworksGridView()
}
