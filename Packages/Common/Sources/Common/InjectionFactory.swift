//
//  File.swift
//  Common
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation

public class DependencyInjectedFactory: @unchecked Sendable {
    private var services: [String: Any] = [:]

    static public let shared = DependencyInjectedFactory()

    private init() {}

    public func register<T>(_ service: T, for type: T.Type) {
        let key = String(describing: type)
        services[key] = service
    }

    public func provide<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let service = services[key] as? T else {
            fatalError("Service \(type) is not registered!")
        }
        return service
    }
    
    public func clearAll() {
        services = [:]
    }
}
