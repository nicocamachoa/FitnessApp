//
//  RoutineViewModel.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
// ViewModels/RoutineViewModel.swift

import Foundation

class RoutineViewModel: ObservableObject {
    @Published var todaysRoutine: Routine?
    
    func generateTodaysRoutine(user: User, exercises: [Exercise]) {
        todaysRoutine = RoutineService.shared.generateRoutine(for: user, exercises: exercises)
    }
}
