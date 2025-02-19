//
//  RootViewModel.swift
//  Fetch
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Common
import DataModels
import Foundation
import Recipe
import NetworkService
import UIKit

class RootViewModel {
    
    init() {
        initializeDependencies()
    }
    
    func initializeDependencies() {
        NetworkDependencyContainer.register()
        RecipeDependencyContainer.register()
    }
}
