//
//  FavouritesViews.swift
//  Jokes.V2
//
//  Created by Cooper Lawson on 2023-04-19.
//

import Blackbird
import SwiftUI

struct FavouritesViews: View {
    
    // MARK Stored Properties
    
    @BlackbirdLiveModels ({ db in
        try await Joke.read(from: db)
    }) var favouriteJokes
    
    // MARK Computed Properties
    var body: some View {
        List(favouriteJokes.results) {currentJoke in
            VStack(alignment: .leading) {
                Text(currentJoke.setup)
                    .bold()
                Text(currentJoke.punchline)
            }
        }
    }
}

struct FavouritesViews_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesViews()
        // Make the database available to this view in Xcode Previews
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
