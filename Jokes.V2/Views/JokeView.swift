//
//  JokeView.swift
//  Jokes.V2
//
//  Created by Cooper Lawson on 2023-04-14.
//

import SwiftUI

struct JokeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("You see, mountains aren't just funny.")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("Random Dad Jokes")
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
