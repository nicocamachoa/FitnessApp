//
//  Routine.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// Models/Routine.swift

import Foundation

struct Routine: Identifiable, Codable {
    let id: UUID
    let date: Date
    let exercises: [RoutineExercise]
}

struct RoutineExercise: Identifiable, Codable {
    let id: UUID
    let exercise: Exercise
    let repetitions: Int
    let sets: Int
    
    init(exercise: Exercise, repetitions: Int, sets: Int) {
        self.id = UUID()
        self.exercise = exercise
        self.repetitions = repetitions
        self.sets = sets
    }
}
