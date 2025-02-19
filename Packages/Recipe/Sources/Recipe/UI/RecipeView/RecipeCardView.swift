//
//  RecipeCardView.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Combine
import Common
import DataModels
import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                AsyncCachedImage(url: URL(string: recipe.photoURLSmall)!) { image in
                    image
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .shadow(radius: 5)
                } placeholder: {
                    ProgressView()
                }
                
                VStack {
                    Text(recipe.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                        .shadow(radius: 3)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                   startPoint: .bottom, endPoint: .top)
                    .cornerRadius(20)
                )
            }
        }
    }
}

