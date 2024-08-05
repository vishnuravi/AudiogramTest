//
//  AudiometryTask.swift
//  Audiogram
//
//  Created by Vishnu Ravi on 8/5/24.
//

import ResearchKit
import ResearchKitSwiftUI
import SwiftUI

struct AudiometryTask: View {
    @Binding var showingTask: Bool
    
    var audiometryTask: ORKOrderedTask {
        .toneAudiometryTask(
            withIdentifier: "audiometryTask",
            intendedUseDescription: "",
            speechInstruction: "",
            shortSpeechInstruction: "",
            toneDuration: 5,
            options: []
        )
    }
    
    var body: some View {
        ORKOrderedTaskView(tasks: audiometryTask) { result in
            guard case let .completed(taskResult) = result else {
                return
            }
            
            self.showingTask = false
            
        }
    }
}
