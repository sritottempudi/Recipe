//
//  ImageCacheManager.swift
//  Common
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
import UIKit

class ImageCacheManager {
    @MainActor static private var cache: [URL: AsyncImageView] = [:]
    
    @MainActor static subscript(url: URL) -> AsyncImageView?{
        get{
            return ImageCacheManager.cache[url]
        }
        set{
            return ImageCacheManager.cache[url] = newValue
        }
    }
}
