//
//  Recipe.swift
//  DataModels
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation

// MARK: - Recipe
public struct Recipe: Decodable, Sendable, Hashable {
    public let cuisine: String
    public let name: String
    public let photoURLLarge: String
    public let photoURLSmall: String
    public let sourceURL: String?
    public let uuid: String
    public let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case uuid
        case youtubeURL = "youtube_url"
    }
    
    public init(cuisine: String, name: String, photoURLLarge: String, photoURLSmall: String, sourceURL: String?, uuid: String, youtubeURL: String?) {
        self.cuisine = cuisine
        self.name = name
        self.photoURLLarge = photoURLLarge
        self.photoURLSmall = photoURLSmall
        self.sourceURL = sourceURL
        self.uuid = uuid
        self.youtubeURL = youtubeURL
    }
}
