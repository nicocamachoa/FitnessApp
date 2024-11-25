//
//  UserViewModel.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//


// ViewModels/UserViewModel.swift

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    init() {
        loadUser()
    }
    
    func loadUser() {
        if let savedUser = DataService.shared.loadUser() {
            self.user = savedUser
        } else {
            // Si no hay usuario guardado, crear uno por defecto
            self.user = User(name: "Usuario", age: 25, level: .beginner)
            saveUser()
        }
    }
    
    func saveUser() {
        if let user = user {
            DataService.shared.saveUser(user)
        }
    }
    
    func updateLevel(to newLevel: ExerciseLevel) {
        user?.level = newLevel
        saveUser()
    }
    
    func updateFitnessScore(by increment: Int) {
        guard var user = user else { return }
        user.fitnessScore += increment
        // Adjust level based on fitnessScore if needed
        if user.fitnessScore >= 100 {
            user.level = .advanced
        } else if user.fitnessScore >= 50 {
            user.level = .intermediate
        } else {
            user.level = .beginner
        }
        self.user = user
        saveUser()
    }
    
    // Agrega más funciones según sea necesario
}
