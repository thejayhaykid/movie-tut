//
//  Friend.swift
//  movie-tut
//
//  Created by Jake Hayes on 7/2/24.
//

import Foundation
import SwiftData

@Model
final class Friend {
    var name: String
    var favoriteMovie: Movie?
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Jon"),
        Friend(name: "Elena"),
        Friend(name: "Graham"),
        Friend(name: "Mayuri"),
        Friend(name: "Rich"),
        Friend(name: "Rody")
    ]
}
