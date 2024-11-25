//
//  SettingsView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//// Views/SettingsView.swift

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var selectedLevel: ExerciseLevel = .beginner
    @State private var fitnessScore: Int = 0
    
    var body: some View {
        Form {
            Section(header: Text("Perfil")) {
                TextField("Nombre", text: $name)
                TextField("Edad", text: $age)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Nivel de Fitness")) {
                Picker("Nivel de Fitness", selection: $selectedLevel) {
                    Text("Principiante").tag(ExerciseLevel.beginner)
                    Text("Intermedio").tag(ExerciseLevel.intermediate)
                    Text("Avanzado").tag(ExerciseLevel.advanced)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Dificultad Interna")) {
                Slider(value: Binding(
                    get: { Double(self.fitnessScore) },
                    set: { self.fitnessScore = min(max(Int($0), 0), 100) }
                ), in: 0...100, step: 1)
                Text("Fitness Score: \(fitnessScore)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Section {
                Button(action: saveSettings) {
                    Text("Guardar Cambios")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle("Perfil / Ajustes", displayMode: .inline)
        .onAppear {
            loadUserData()
        }
    }
    
    func loadUserData() {
        if let user = userViewModel.user {
            self.name = user.name
            self.age = "\(user.age)"
            self.selectedLevel = user.level
            self.fitnessScore = user.fitnessScore
        }
    }
    
    func saveSettings() {
        guard let ageInt = Int(age) else { return }
        userViewModel.user?.name = name
        userViewModel.user?.age = ageInt
        userViewModel.user?.level = selectedLevel
        userViewModel.user?.fitnessScore = fitnessScore
        userViewModel.saveUser()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(UserViewModel())
    }
}
