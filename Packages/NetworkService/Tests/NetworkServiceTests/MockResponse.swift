//
//  MockResponse.swift
//  NetworkService
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import XCTest

struct MockResponse: Codable, Equatable {
    let id: Int
    let name: String
    let description: String?
}
