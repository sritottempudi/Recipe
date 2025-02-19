//
//  FetchApp.swift
//  Fetch
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import SwiftUI

@main
struct FetchApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: .init())
        }
    }
}
