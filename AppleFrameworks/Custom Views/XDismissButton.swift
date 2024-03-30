//
//  XDismissButton.swift
//  AppleFrameworks
//
//  Created by Epic_Sys on 30/03/2024.
//

import SwiftUI

struct XDismissButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundStyle(Color(UIColor.label))
                    .frame(width: 44, height: 44)
            })
            .padding()
        }
    }
}

#Preview {
    XDismissButton()
}
