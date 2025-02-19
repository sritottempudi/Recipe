//
//  NetworkDependencyContainer.swift
//  NetworkService
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Common

public class NetworkDependencyContainer {
    
    public static func register() {
        DependencyInjectedFactory.shared.register(NetworkService(),
                                                  for: NetworkServiceable.self)
    }
}
