//
//  InitialEvaluationView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
// Views/InitialEvaluationView.swift

import SwiftUI

struct InitialEvaluationView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var selectedLevel: ExerciseLevel = .beginner
    @State private var showNextStep: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Evaluación Inicial")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Nombre", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Edad", text: $age)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Picker("Nivel de Fitness", selection: $selectedLevel) {
                    Text("Principiante").tag(ExerciseLevel.beginner)
                    Text("Intermedio").tag(ExerciseLevel.intermediate)
                    Text("Avanzado").tag(ExerciseLevel.advanced)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                NavigationLink(
                    destination: MainTabView()
                        .environmentObject(userViewModel)
                        .environmentObject(ExerciseData())
                        .environmentObject(TrainingData()),
                    isActive: $showNextStep
                ) {
                    Button(action: {
                        saveUserData()
                        showNextStep = true
                    }) {
                        Text("Comenzar")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func saveUserData() {
        guard let ageInt = Int(age) else { return }
        let newUser = User(name: name, age: ageInt, level: selectedLevel)
        userViewModel.user = newUser
        userViewModel.saveUser()
    }
}

struct InitialEvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        InitialEvaluationView().environmentObject(UserViewModel())
    }
}
