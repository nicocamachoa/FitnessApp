//
//  TrainingData.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//


// Models/TrainingData.swift

import Foundation

class TrainingData: ObservableObject {
    @Published var trainings: [Training] = [
        Training(name: "Fuerza Básica", goal: "Mejorar fuerza en el tren superior y piernas.", difficulty: 30),
        Training(name: "Resistencia Cardiovascular", goal: "Aumentar resistencia en carrera de 10K.", difficulty: 40)
        // Add more default trainings
    ]
}
