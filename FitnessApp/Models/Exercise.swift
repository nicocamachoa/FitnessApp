//
//  ExerciseLevel.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

import Foundation

enum ExerciseLevel: String, Codable {
    case beginner
    case intermediate
    case advanced
}

struct Exercise: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let levels: [ExerciseLevel]
    
    init(name: String, description: String, levels: [ExerciseLevel]) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.levels = levels
    }
}
