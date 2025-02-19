//
//  NetworkError.swift
//  NetworkService
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

public enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingError
    case unknown
}

