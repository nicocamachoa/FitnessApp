//
//  QuickStartView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
// Views/QuickStartView.swift

import SwiftUI

struct QuickStartView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var exerciseData: ExerciseData
    @EnvironmentObject var routineViewModel: RoutineViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Inicio Rápido")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Iniciarás todos los ejercicios programados para hoy.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                startRoutine()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Iniciar Entrenamiento")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
    }
    
    func startRoutine() {
        if let user = userViewModel.user {
            routineViewModel.generateTodaysRoutine(user: user, exercises: exerciseData.exercises)
            // Lógica adicional para marcar la rutina como iniciada si es necesario
        }
    }
}

struct QuickStartView_Previews: PreviewProvider {
    static var previews: some View {
        QuickStartView()
            .environmentObject(UserViewModel())
            .environmentObject(ExerciseData())
            .environmentObject(RoutineViewModel())
    }
}
