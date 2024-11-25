//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// FitnessAppApp.swift

import SwiftUI

@main
struct FitnessAppApp: App {
    @StateObject private var exerciseData = ExerciseData()
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var routineViewModel = RoutineViewModel()
    @StateObject private var trainingData = TrainingData()
    
    var body: some Scene {
        WindowGroup {
            if userViewModel.user == nil {
                InitialEvaluationView()
                    .environmentObject(userViewModel)
                    .environmentObject(exerciseData)
                    .environmentObject(trainingData)
            } else {
                MainTabView()
                    .environmentObject(userViewModel)
                    .environmentObject(exerciseData)
                    .environmentObject(routineViewModel)
                    .environmentObject(trainingData)
            }
        }
    }
}
