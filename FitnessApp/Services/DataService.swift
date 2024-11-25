//
//  DataService.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// Services/DataService.swift

import Foundation

class DataService {
    static let shared = DataService()
    
    private let userKey = "fitnessAppUser"
    private let trainingsKey = "fitnessAppTrainings"
    
    func saveUser(_ user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
        }
    }
    
    func loadUser() -> User? {
        if let savedUser = UserDefaults.standard.data(forKey: userKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
            return decodedUser
        }
        return nil
    }
    
    func saveTrainings(_ trainings: [Training]) {
        if let encoded = try? JSONEncoder().encode(trainings) {
            UserDefaults.standard.set(encoded, forKey: trainingsKey)
        }
    }
    
    func loadTrainings() -> [Training]? {
        if let savedTrainings = UserDefaults.standard.data(forKey: trainingsKey),
           let decodedTrainings = try? JSONDecoder().decode([Training].self, from: savedTrainings) {
            return decodedTrainings
        }
        return nil
    }
}
