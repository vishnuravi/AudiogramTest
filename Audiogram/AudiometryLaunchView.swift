//
//  AudiometryLaunchView.swift
//  Audiogram
//
//  Created by Vishnu Ravi on 8/5/24.
//

import SwiftUI

struct AudiometryLaunchView: View {
    @State private var activateTest = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Test your hearing!")
                .font(.title)
            Spacer()
            Button("Launch Test") {
                activateTest.toggle()
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $activateTest) {
                AudiometryTask(showingTask: $activateTest)
            }
            Spacer()
        }
    }
}

#Preview {
    AudiometryLaunchView()
}
