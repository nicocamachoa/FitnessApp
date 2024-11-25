//
//  ProgressViewScreen.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//
// Views/ProgressView.swift

import SwiftUI

struct ProgressViewScreen: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Tu Progreso")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    if let user = userViewModel.user {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Total de Entrenamientos: \(user.progress.totalWorkouts)")
                            Text("Racha de Días: \(user.progress.streak)")
                            
                            ProgressView(value: Double(user.fitnessScore) / 100.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                            // Fitness Score se utiliza internamente y no se muestra directamente
                        }
                        .padding()
                        
                        Divider()
                        
                        Text("Insignias")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        if user.progress.badges.isEmpty {
                            Text("No has obtenido insignias todavía.")
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(user.progress.badges) { badge in
                                        VStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.yellow)
                                            Text(badge.name)
                                                .font(.caption)
                                                .multilineTextAlignment(.center)
                                        }
                                        .padding()
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        Divider()
                        
                        Text("Estadísticas")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        // Placeholder para gráficos y estadísticas
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Progreso Semanal")
                            // Aquí puedes implementar gráficos usando SwiftUI Charts o librerías similares
                            // Por simplicidad, utilizamos textos como marcadores de posición
                            Text("Semana 1: 5 entrenamientos")
                            Text("Semana 2: 7 entrenamientos")
                            Text("Semana 3: 10 entrenamientos")
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Progreso", displayMode: .inline)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewScreen()
            .environmentObject(UserViewModel())
    }
}
