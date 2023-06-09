//
//  JokeView.swift
//  Jokes.V2
//
//  Created by Cooper Lawson on 2023-04-14.
//

import SwiftUI

struct JokeView: View {
    
    // MARK Stored Properties
    
    // 0.0 is invisible, 1.0 is visible
    @State var punchlineOpacity = 0.0
    
    // The current joke to display
    @State var currentJoke: Joke?
    
    // MARK Computed Porperties
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                if let currentJoke = currentJoke {
                    
//                    Text("You see, mountains aren't just funny.")
                    Text(currentJoke.setup)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)) {
                            punchlineOpacity = 1.0
                        }
                    }, label: {
                        Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width:40)
                            .tint(.black)
                              
                              })
                        
//                        Text("They are hill areas")
                        Text(currentJoke.punchline)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .opacity(punchlineOpacity)
                    
                } else {
                    ProgressView()
                }
                
                Spacer()
                
                
                Button(action: {
                // Reset the interface
                punchlineOpacity = 0.0

                Task {
                    // Get another joke
                    withAnimation {
                        currentJoke = nil
                    }
                    currentJoke = await NetworkService.fetch()
                }
            }, label: {
                Text("Fetch another one")
            })
            .disabled(punchlineOpacity == 0.0 ? true : false)
            .buttonStyle(.borderedProminent)
                
            }
            
            .navigationTitle("Random Dad Jokes")
        }
        .task {
            currentJoke = await NetworkService.fetch()
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
