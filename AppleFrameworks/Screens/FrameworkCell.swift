//
//  FrameworkCell.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 30/03/2024.
//

import SwiftUI

struct FrameworkCell: View {
    private let framework: Framework
    private let isList: Bool
    
    init(framework: Framework, showAsList isList: Bool) {
        self.framework = framework
        self.isList = isList
    }
    
    var body: some View {
        if isList {
            frameworkList
        } else {
            frameworkGrid
        }
    }
    
    private var frameworkList: some View {
        HStack(spacing: 16) {
            Image(framework.image)
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit() // Enable Shrink
                .minimumScaleFactor(0.6)
                .foregroundStyle(Color(.label))
        }
    }
    
    private var frameworkGrid: some View {
        VStack(spacing: 8) {
            Image(framework.image)
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit() // Enable Shrink
                .minimumScaleFactor(0.6)
                .foregroundStyle(Color(.label))
        }
    }
}
#Preview {
    FrameworkCell(framework: MockData.sampleFramework, showAsList: false)
}
