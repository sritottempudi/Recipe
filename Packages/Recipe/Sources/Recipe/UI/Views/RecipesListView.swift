//
//  RecipesListView.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/12/25.
//

import SwiftUI
import Common
import DataModels
import AVKit

struct RecipesListView: View {
    @State private var recipes: [Recipe]
    @State private var path = NavigationPath()
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    var body: some View {
        NavigationStack {            
            List(recipes, id: \.uuid) { recipe in
                HStack {
                    RecipeCardView(recipe: recipe)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .listRowBackground(Color.clear)
                }
                // This is a hack that was used to display the UI properly due to time constraint.
                .listRowBackground(Color.clear)
                    .overlay(
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            EmptyView()
                        }
                        .opacity(0)
                    )
            }
            .listStyle(.plain)
            .navigationTitle("Recipes")
            .edgesIgnoringSafeArea(.horizontal)
        }
    }
}
