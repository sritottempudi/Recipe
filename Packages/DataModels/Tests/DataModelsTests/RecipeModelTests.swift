//
//  File.swift
//  DataModels
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import XCTest

final class MockRecipeModelTests: XCTestCase {
    
    /// Valid JSON with all fields
    let validJSON = """
    {
        "recipes": [
            {
                "cuisine": "Malaysian",
                "name": "Apam Balik",
                "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
            }
        ]
    }
    """.data(using: .utf8)!
    
    /// JSON missing optional `source_url` & `youtube_url`
    let jsonWithoutOptionalFields = """
    {
        "recipes": [
            {
                "cuisine": "American",
                "name": "Hot Chocolate Fudge",
                "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/6d8e878b-0ca8-4173-94b7-60a006b676d6/large.jpg",
                "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/6d8e878b-0ca8-4173-94b7-60a006b676d6/small.jpg",
                "uuid": "a43f53ea-4d06-46c1-bd20-5d8e487ea52b"
            }
        ]
    }
    """.data(using: .utf8)!
    
    /// Invalid JSON
    let invalidJSON = """
    {
        "recipes": [
            {
                "cuisine": "British",
                "name": "Jam Roly-Poly"
            }
        ]
    }
    """.data(using: .utf8)!
}

