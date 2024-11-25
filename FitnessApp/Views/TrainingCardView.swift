//
//  TrainingCardView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// Views/TrainingCardView.swift

import SwiftUI

struct TrainingCardView: View {
    @EnvironmentObject var trainingData: TrainingData
    @EnvironmentObject var userViewModel: UserViewModel
    let training: Training
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(training.name)
                    .font(.headline)
                Spacer()
                if training.isActive {
                    Text("Activo")
                        .font(.subheadline)
                        .foregroundColor(.green)
                } else {
                    Text("Inactivo")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
            Text(training.goal)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Text("Progreso: \(training.progress.completedExercises.count) / \(training.progress.currentExercises.count)")
                Spacer()
                Text("Dificultad: \(training.difficulty)")
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack {
                if !training.isActive {
                    Button(action: {
                        addTrainingToDaily(training: training)
                    }) {
                        Text("Agregar al Día")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                } else {
                    Button(action: {
                        toggleTrainingStatus(training: training)
                    }) {
                        Text("Pausar")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        resetTraining(training: training)
                    }) {
                        Text("Resetear")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
    
    func addTrainingToDaily(training: Training) {
        guard var user = userViewModel.user else { return }
        // Lógica para agregar el entrenamiento al día a día
        // Por ejemplo, marcar el entrenamiento como activo
        if let index = trainingData.trainings.firstIndex(where: { $0.id == training.id }) {
            trainingData.trainings[index].isActive = true
            userViewModel.user = user
            userViewModel.saveUser()
        }
    }
    
    func toggleTrainingStatus(training: Training) {
        if let index = trainingData.trainings.firstIndex(where: { $0.id == training.id }) {
            trainingData.trainings[index].isActive.toggle()
            userViewModel.saveUser()
        }
    }
    
    func resetTraining(training: Training) {
        if let index = trainingData.trainings.firstIndex(where: { $0.id == training.id }) {
            trainingData.trainings[index].progress = TrainingProgress()
            userViewModel.saveUser()
        }
    }
}

struct TrainingCardView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCardView(training: TrainingData().trainings[0])
            .environmentObject(TrainingData())
            .environmentObject(UserViewModel())
    }
}
