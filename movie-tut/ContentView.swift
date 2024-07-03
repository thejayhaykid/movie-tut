//
//  ContentView.swift
//  movie-tut
//
//  Created by Jake Hayes on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FilteredMovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            
            FriendList()
                .tabItem {
                    Label("Friends", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
