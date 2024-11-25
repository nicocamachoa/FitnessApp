//
//  PersonalizedStartView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// Views/PersonalizedStartView.swift

import SwiftUI

struct PersonalizedStartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var exerciseData: ExerciseData
    @EnvironmentObject var routineViewModel: RoutineViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedExercises: [Exercise] = []
    @State private var availableExercises: [Exercise] = []
    @State private var timeAvailable: Int = 20 // minutos
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Inicio Personalizado")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Selecciona los ejercicios que deseas realizar o ajusta el tiempo disponible.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Picker("Tiempo Disponible (min)", selection: $timeAvailable) {
                    ForEach(10..<121, id: \.self) { minute in
                        Text("\(minute) min").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 100)
                
                List {
                    ForEach(availableExercises) { exercise in
                        HStack {
                            Text(exercise.name)
                            Spacer()
                            if selectedExercises.contains(where: { $0.id == exercise.id }) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            toggleSelection(for: exercise)
                        }
                    }
                }
                
                Button(action: {
                    startPersonalizedRoutine()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Iniciar Personalizado")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationBarTitle("Personalizado", displayMode: .inline)
            .onAppear {
                loadAvailableExercises()
            }
        }
    }
    
    func loadAvailableExercises() {
        if let user = userViewModel.user {
            availableExercises = exerciseData.exercises.filter { $0.levels.contains(user.level) }
        }
    }
    
    func toggleSelection(for exercise: Exercise) {
        if let index = selectedExercises.firstIndex(where: { $0.id == exercise.id }) {
            selectedExercises.remove(at: index)
        } else {
            selectedExercises.append(exercise)
        }
    }
    
    func startPersonalizedRoutine() {
        if let user = userViewModel.user {
            // Generar rutina basada en los ejercicios seleccionados y tiempo disponible
            var selected = selectedExercises
            if selected.isEmpty {
                selected = exerciseData.exercises.filter { $0.levels.contains(user.level) }
            }
            let routineExercises = selected.map { RoutineExercise(exercise: $0, repetitions: 10, sets: 3) } // Ajustar según necesidad
            let routine = Routine(id: UUID(), date: Date(), exercises: routineExercises)
            routineViewModel.todaysRoutine = routine
            // Lógica adicional para manejar timeAvailable si es necesario
        }
    }
}

struct PersonalizedStartView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizedStartView()
            .environmentObject(UserViewModel())
            .environmentObject(ExerciseData())
            .environmentObject(RoutineViewModel())
    }
}
