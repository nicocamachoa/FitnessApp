//
//  ExerciseData.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

import Foundation

class ExerciseData: ObservableObject {
    @Published var exercises: [Exercise] = [
        Exercise(
            name: "Flexiones de Brazos",
            description: "Ejercicio de fuerza para el tren superior.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Abdominales",
            description: "Ejercicio para fortalecer el core.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Sentadillas",
            description: "Ejercicio de fuerza para piernas.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Plank",
            description: "Ejercicio de estabilización del core.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Dominadas",
            description: "Ejercicio de fuerza para la espalda y brazos.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Fondos de Tríceps en Banco",
            description: "Ejercicio para tríceps y pecho.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Levantamientos de Piernas",
            description: "Ejercicio para abdominales inferiores.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Carrera de 10K",
            description: "Entrenamiento de resistencia cardiovascular.",
            levels: [.beginner, .intermediate, .advanced]
        ),
        Exercise(
            name: "Movilidad y Flexibilidad",
            description: "Rutinas de estiramiento y yoga.",
            levels: [.beginner, .intermediate, .advanced]
        )
    ]
}
