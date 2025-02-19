//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/12/25.
//

import Common
import DataModels
import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    image
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(recipe.name)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .padding(.horizontal)
                        
                        Text(recipe.cuisine.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        Divider()
                            .padding(.horizontal)
                        
                        if let sourceURL = recipe.sourceURL, let url = URL(string: sourceURL) {
                            FetchButton(title: "View Full Recipe", icon: "book.fill", backgroundColor: .blue.opacity(0.8)) {
                                UIApplication.shared.open(url)
                            }
                        }
                        
                        if let youtubeURL = recipe.youtubeURL, let url = URL(string: youtubeURL) {
                            FetchButton(title: "Watch Recipe Video", icon: "play.circle.fill", backgroundColor: .red) {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                    .padding(.top, 25)
                    .padding(.bottom)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle(recipe.name)
        }
    
    var image: some View {
        AsyncCachedImage(url: URL(string: recipe.photoURLSmall)!) { image in
            image
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .shadow(radius: 10)
        } placeholder: {
            ProgressView()
        }
        .padding(.bottom)
        .edgesIgnoringSafeArea(.top)
    }
}
