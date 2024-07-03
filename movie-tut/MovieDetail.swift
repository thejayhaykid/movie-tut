//
//  MovieDetailView.swift
//  movie-tut
//
//  Created by Jake Hayes on 7/2/24.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends: [Friend] {
        movie.favoritedBy.sorted { first, second in
            first.name < second.name
        }
    }
       
   var body: some View {
       Form {
           TextField("Movie title", text: $movie.title)
           DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
           
           if !movie.favoritedBy.isEmpty {
               Section("Favorited by") {
                   ForEach(sortedFriends) { friend in
                       Text(friend.name)
                   }
               }
           }
       }
       .navigationTitle(isNew ? "New Movie" : "Movie")
       .toolbar {
           if isNew {
               ToolbarItem(placement: .confirmationAction) {
                   Button("Done") {
                       dismiss()
                   }
               }
               
               ToolbarItem(placement: .cancellationAction) {
                   Button("Cancel") {
                       context.delete(movie)
                       dismiss()
                   }
               }
           }
       }
   }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)       
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
