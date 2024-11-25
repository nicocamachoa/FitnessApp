//
//  User.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var age: Int
    var level: ExerciseLevel
    var fitnessScore: Int // 0-100 internal difficulty
    var progress: ProgressData // Ahora hace referencia a la definición en ProgressData.swift
    var lastEvaluationDate: Date?
    
    init(name: String, age: Int, level: ExerciseLevel) {
        self.id = UUID()
        self.name = name
        self.age = age
        self.level = level
        self.fitnessScore = 0 // Initialize to 0, adjust as needed
        self.progress = ProgressData() // Instancia del modelo correcto
        self.lastEvaluationDate = nil
    }
}
