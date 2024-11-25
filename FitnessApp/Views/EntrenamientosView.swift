//
//  EntrenamientosView.swift
//  FitnessApp
//
//  Created by Nicolas Francisco Camacho Alarcon on 25/11/24.
//

// Views/EntrenamientosView.swift

import SwiftUI

struct EntrenamientosView: View {
    @EnvironmentObject var trainingData: TrainingData
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(trainingData.trainings) { training in
                        TrainingCardView(training: training)
                            .environmentObject(trainingData)
                            .environmentObject(userViewModel)
                    }
                }
            }
            .navigationBarTitle("Entrenamientos", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: AddTrainingView()) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct EntrenamientosView_Previews: PreviewProvider {
    static var previews: some View {
        EntrenamientosView()
            .environmentObject(TrainingData())
            .environmentObject(UserViewModel())
    }
}
