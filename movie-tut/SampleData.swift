//
//  SampleData.swift
//  movie-tut
//
//  Created by Jake Hayes on 7/2/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    private init() {
        let schema = Schema([
            Movie.self,
        ])
        let modelConfiguration =  ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
        } catch {
            fatalError("Could not create sample data \(error)")
        }
    }
    
    func insertSampleData() {
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        do {
            try context.save()
        } catch {
            print("Sample data failed to save to context.")
        }
    }
    
    var movie: Movie {
        Movie.sampleData[0]
    }
}
