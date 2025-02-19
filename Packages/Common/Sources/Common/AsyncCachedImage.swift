//
//  AsyncCachedImage.swift
//  Common
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import SwiftUI

@MainActor
public struct AsyncCachedImage<ImageView: View, PlaceholderView: View>: View {
    // Input dependencies
    var url: URL?
    @ViewBuilder var content: (AsyncImageView) -> ImageView
    @ViewBuilder var placeholder: () -> PlaceholderView
    
    // Downloaded image
    @State var image: AsyncImageView? = nil
    
    public init(
        url: URL?,
        @ViewBuilder content: @escaping (AsyncImageView) -> ImageView,
        @ViewBuilder placeholder: @escaping () -> PlaceholderView
    ) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
    }
    
    public var body: some View {
        VStack {
            if let asyncImage = image {
                content(asyncImage)
            } else {
                placeholder()
                    .onAppear {
                        Task {
                            image = await downloadPhoto()
                        }
                    }
            }
        }
    }
    
    // Downloads if the image is not cached already
    // Otherwise returns from the cache
    private func downloadPhoto() async -> AsyncImageView? {

        guard let url else { return nil }
        
        // Check if the image is cached already
        if let cachedImage = ImageCacheManager[url] {
            return cachedImage
        } else {
            let downloadedImage = AsyncImageView(imageUrlString: url.absoluteString)
            ImageCacheManager[url] = downloadedImage
            
            return downloadedImage
        }
    }
}
