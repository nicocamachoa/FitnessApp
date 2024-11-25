//
//  Training.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//


// Models/Training.swift

import Foundation

struct Training: Identifiable, Codable {
    let id: UUID
    var name: String
    var goal: String
    var isActive: Bool
    var progress: TrainingProgress
    var difficulty: Int // 0-100 internal difficulty
    
    init(name: String, goal: String, isActive: Bool = false, progress: TrainingProgress = TrainingProgress(), difficulty: Int = 0) {
        self.id = UUID()
        self.name = name
        self.goal = goal
        self.isActive = isActive
        self.progress = progress
        self.difficulty = difficulty
    }
}

struct TrainingProgress: Codable {
    var currentExercises: [UUID] = []
    var completedExercises: [UUID] = []
    var nextWorkoutDate: Date = Date()
    // Additional progress data
}
