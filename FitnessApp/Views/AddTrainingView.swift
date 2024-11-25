//
//  AddTrainingView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
// Views/AddTrainingView.swift

import SwiftUI

struct AddTrainingView: View {
    @EnvironmentObject var trainingData: TrainingData
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var goal: String = ""
    @State private var difficulty: Int = 0
    
    var body: some View {
        Form {
            Section(header: Text("Nombre del Entrenamiento")) {
                TextField("Nombre", text: $name)
            }
            
            Section(header: Text("Objetivo")) {
                TextField("Objetivo", text: $goal)
            }
            
            Section(header: Text("Dificultad (0-100)")) {
                Slider(value: Binding(
                    get: { Double(self.difficulty) },
                    set: { self.difficulty = min(max(Int($0), 0), 100) }
                ), in: 0...100, step: 1)
                Text("\(difficulty)")
            }
            
            Section {
                Button(action: addTraining) {
                    Text("Agregar Entrenamiento")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle("Agregar Entrenamiento", displayMode: .inline)
    }
    
    func addTraining() {
        let newTraining = Training(name: name, goal: goal, difficulty: difficulty)
        trainingData.trainings.append(newTraining)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        AddTrainingView()
            .environmentObject(TrainingData())
            .environmentObject(UserViewModel())
    }
}
