//
//  NetworkServiceable.swift
//  NetworkService
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation

public protocol NetworkServiceable {
    func request<T: Decodable>(networkRequest: NetworkRequest) async throws -> T
}
