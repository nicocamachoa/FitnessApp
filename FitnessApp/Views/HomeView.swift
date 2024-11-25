//
//  HomeView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// Views/HomeView.swift

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var exerciseData: ExerciseData
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var routineViewModel: RoutineViewModel
    @EnvironmentObject var trainingData: TrainingData
    
    @State private var showQuickStart = false
    @State private var showPersonalizedStart = false
    @State private var showAddTraining = false
    @State private var isRoutineCompleted = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Greeting
                if let user = userViewModel.user {
                    Text("¡Hola, \(user.name)!")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                }
                
                // Training Summary
                if let routine = routineViewModel.todaysRoutine {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Tu Entrenamiento de Hoy")
                            .font(.headline)
                        
                        List {
                            ForEach(routine.exercises) { routineExercise in
                                HStack {
                                    Text(routineExercise.exercise.name)
                                    Spacer()
                                    Text("Reps: \(routineExercise.repetitions) x Sets: \(routineExercise.sets)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .frame(height: 200)
                        
                        // Buttons
                        HStack(spacing: 20) {
                            Button(action: {
                                showQuickStart = true
                            }) {
                                Text("Inicio Rápido")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                showPersonalizedStart = true
                            }) {
                                Text("Personalizado")
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                        }
                        .sheet(isPresented: $showPersonalizedStart) {
                            PersonalizedStartView()
                                .environmentObject(userViewModel)
                                .environmentObject(exerciseData)
                        }
                    }
                } else {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("No tienes entrenamientos activos.")
                            .font(.headline)
                        
                        Text("Agrega entrenamientos desde la sección de Entrenamientos.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            showAddTraining = true
                        }) {
                            Text("Agregar Entrenamiento")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showAddTraining) {
                            EntrenamientosView()
                                .environmentObject(trainingData)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Inicio", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    // Acción para refrescar rutina o cualquier otra lógica
                    if let user = userViewModel.user {
                        routineViewModel.generateTodaysRoutine(user: user, exercises: exerciseData.exercises)
                    }
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
            .onAppear {
                if let user = userViewModel.user {
                    routineViewModel.generateTodaysRoutine(user: user, exercises: exerciseData.exercises)
                }
            }
            .sheet(isPresented: $showQuickStart) {
                QuickStartView()
                    .environmentObject(userViewModel)
                    .environmentObject(exerciseData)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ExerciseData())
            .environmentObject(UserViewModel())
            .environmentObject(RoutineViewModel())
            .environmentObject(TrainingData())
    }
}
