//
//  ContentView.swift
//  Fetch
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import SwiftUI
import Recipe

struct RootView: View {
    
    var viewModel: RootViewModel
    
    var body: some View {
        RecipeView(viewModel: .init())
    }
}
