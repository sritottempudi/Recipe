//
//  Inject.swift
//  Common
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation

@propertyWrapper
public struct Inject<Type> {
    
    var type: Type
    
    public init() {
        self.type = DependencyInjectedFactory.shared.provide(Type.self)
    }
    
    public var wrappedValue: Type {
        get {
            return self.type
        }
        mutating set {
            self.type = newValue
        }
    }
}
