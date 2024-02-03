//
//  SortingAlgorithmVisualizerApp.swift
//  SortingAlgorithmVisualizer
//
//  Created by Neal Archival on 1/30/24.
//

import SwiftUI

@main
struct SortingAlgorithmVisualizerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 500, height: 300)
                .navigationTitle("Sorting Algorithm Visualizer")
        }
        .windowResizability(.contentSize)
    }
}
