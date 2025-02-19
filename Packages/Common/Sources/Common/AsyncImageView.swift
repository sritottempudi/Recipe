//
//  AsyncImageView.swift
//  Common
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import SwiftUI

public struct AsyncImageView: View {
    let imageUrlString: String

    public init(imageUrlString: String) {
        self.imageUrlString = imageUrlString
    }
    
    public var body: some View {
        AsyncImage(url: URL(string: imageUrlString)) { phase in
            switch phase {
            case .empty:
                ProgressView() // Show a loading indicator while downloading
            case .success(let image):
                image.resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .failure:
                Image(systemName: "photo") // Placeholder on failure
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}
