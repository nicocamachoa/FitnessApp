//
//  ProgressData.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//


import Foundation

struct ProgressData: Codable {
    var completedExercises: [UUID] = []
    var totalWorkouts: Int = 0
    var streak: Int = 0
    var badges: [Badge] = []
}

struct Badge: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let dateAchieved: Date
    
    init(name: String, description: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.dateAchieved = Date()
    }
}
