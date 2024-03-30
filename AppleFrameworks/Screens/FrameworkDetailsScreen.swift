//
//  FrameworkDetailsScreen.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 29/03/2024.
//

import SwiftUI

enum PresentedKind {
    case navigationView
    case sheet
}

struct FrameworkDetailsScreen: View {
    @State private var isWebViewAppear = false
    private let framework: Framework
    private let style: PresentedKind
    
    init(framework: Framework, presentedAs style: PresentedKind) {
        self.framework = framework
        self.style = style
    }
    
    var body: some View {
        VStack {
            if style == .sheet {
                XDismissButton()
            }
            
            ScrollView {
                    FrameworkCell(framework: framework, showAsList: false)
                
                Text(framework.description)
                    .font(.body)
                    .padding()
            }
            
            Spacer()
            
            Button {
                isWebViewAppear.toggle()
            } label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 280, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.pink)
                    )
            }
            .fullScreenCover(isPresented: $isWebViewAppear, content: {
                if let url = URL(string: framework.urlString) {
                    SafariScreen(url: url)
                        .ignoresSafeArea()
                }
            })
        }
    }
}

#Preview {
    FrameworkDetailsScreen(framework: MockData.sampleFramework, presentedAs: .sheet)
}
