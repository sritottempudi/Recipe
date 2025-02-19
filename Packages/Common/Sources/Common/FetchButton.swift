//
//  FetchButton.swift
//  Common
//
//  Created by Srinivasa Rao Tottempudi on 2/12/25.
//

import SwiftUI

public struct FetchButton: View {
    let title: String
    let icon: String?
    let backgroundColor: Color
    let action: () -> Void
    
    public init(title: String, icon: String?, backgroundColor: Color, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(.white)
                }
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}
