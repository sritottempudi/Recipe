//
//  RecipeView.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import SwiftUI

public struct RecipeView: View {
    
    @ObservedObject private var viewModel: RecipeViewModel
    
    public init(viewModel: RecipeViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        switch viewModel.viewState {
        case .loading:
            Text("Loading")
                .onAppear {
                    Task {
                        await viewModel.fetchRecipe()
                    }
                }
        case .loaded(let data):
            if data.recipes.count == 0 {
                Text("Empty Receipes")
            }
            else {
                RecipesListView(recipes: data.recipes)
            }
        case .error:
            Text("Error")
        }
    }
    

    
}
