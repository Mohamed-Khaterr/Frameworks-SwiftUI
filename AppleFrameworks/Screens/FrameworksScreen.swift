//
//  FrameworksScreen.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 29/03/2024.
//

import SwiftUI

struct FrameworksScreen: View {
    
    @StateObject var viewModel = FrameworkViewModel()
    @State private var isList = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            if isList {
                list()
                
            } else {
                gird()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tint(Color(.label))
    }
    
    private func list() -> some View {
        List {
            ForEach(viewModel.frameworks) { framework in
                NavigationLink(
                    destination: FrameworkDetailsScreen(framework: framework,
                                                        presentedAs: .navigationView)
                ) {
                    FrameworkCell(framework: framework, showAsList: true)
                }
            }
        }
        .modifier(NavigationBarModifier(isList: $isList))
        
    }
    
    private func gird() -> some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.frameworks) { framework in
                    FrameworkCell(framework: framework, showAsList: false)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                        .sheet(isPresented: $viewModel.isShowDetails, content: {
                            if let selectedFramework = viewModel.selectedFramework {
                                FrameworkDetailsScreen(framework: selectedFramework, presentedAs: .sheet)
                            }
                        })
                }
            }
        }
        .modifier(NavigationBarModifier(isList: $isList))
    }
    
    private struct NavigationBarModifier: ViewModifier {
        @Binding var isList: Bool
        private var imageName: String { isList ? "square.grid.2x2" : "list.bullet" }
        
        func body(content: Content) -> some View {
            content
                .navigationTitle("🍎 Frameworks")
                .toolbar {
                    Button(action: {
                        isList.toggle()
                    }, label: {
                        Image(systemName: imageName)
                    })
                }
                .padding(.bottom, 1)
                
            
        }
    }
}

#Preview {
    FrameworksScreen()
        .preferredColorScheme(.light)
}
