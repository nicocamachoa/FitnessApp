//
//  MainTabView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//


// Views/MainTabView.swift

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
            
            EntrenamientosView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Entrenamientos")
                }
            
            ProgressViewScreen()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Progreso")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Perfil")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ExerciseData())
            .environmentObject(UserViewModel())
            .environmentObject(RoutineViewModel())
            .environmentObject(TrainingData())
    }
}
