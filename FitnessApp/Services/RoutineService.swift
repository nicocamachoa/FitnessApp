//
//  RoutineService.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
// Services/RoutineService.swift

import Foundation

class RoutineService {
    static let shared = RoutineService()
    
    func generateRoutine(for user: User, exercises: [Exercise]) -> Routine {
        let selectedExercises = exercises.filter { $0.levels.contains(user.level) }
        
        var routineExercises: [RoutineExercise] = []
        
        for exercise in selectedExercises {
            let (reps, sets) = getRepsAndSets(for: exercise, level: user.level)
            let routineExercise = RoutineExercise(exercise: exercise, repetitions: reps, sets: sets)
            routineExercises.append(routineExercise)
        }
        
        // Actualizar progreso
        var updatedUser = user
        updatedUser.progress.totalWorkouts += 1
        if let lastDate = updatedUser.lastEvaluationDate {
            if Calendar.current.isDateInYesterday(lastDate) || Calendar.current.isDateInToday(lastDate) {
                updatedUser.progress.streak += 1
            } else {
                updatedUser.progress.streak = 1
            }
        } else {
            updatedUser.progress.streak = 1
        }
        updatedUser.lastEvaluationDate = Date()
        
        // Asignar insignias
        assignBadges(to: &updatedUser)
        
        // Ajustar fitnessScore
        adjustFitnessScore(for: &updatedUser)
        
        // Guardar usuario actualizado
        DataService.shared.saveUser(updatedUser)
        
        return Routine(id: UUID(), date: Date(), exercises: routineExercises)
    }
    
    private func getRepsAndSets(for exercise: Exercise, level: ExerciseLevel) -> (Int, Int) {
        switch level {
        case .beginner:
            return (8, 2)
        case .intermediate:
            return (12, 3)
        case .advanced:
            return (15, 4)
        }
    }
    
    private func assignBadges(to user: inout User) {
        if user.progress.totalWorkouts == 10 {
            let badge = Badge(name: "10 Entrenamientos", description: "Has completado 10 entrenamientos.")
            user.progress.badges.append(badge)
        }
        if user.progress.streak == 7 {
            let badge = Badge(name: "7 Días de Racha", description: "Has entrenado 7 días consecutivos.")
            user.progress.badges.append(badge)
        }
        // Añadir más condiciones para otras insignias
    }
    
    private func adjustFitnessScore(for user: inout User) {
        // Simple logic: Increment fitnessScore based on totalWorkouts
        user.fitnessScore += 5
        // Adjust level based on fitnessScore
        if user.fitnessScore >= 100 {
            user.level = .advanced
        } else if user.fitnessScore >= 50 {
            user.level = .intermediate
        } else {
            user.level = .beginner
        }
    }
}
