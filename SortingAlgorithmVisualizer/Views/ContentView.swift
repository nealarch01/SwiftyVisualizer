//
//  ContentView.swift
//  SortingAlgorithmVisualizer
//
//  Created by Neal Archival on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var algorithmType: AlgorithmType = .bubbleSort
    @StateObject private var container = BarContainer()
    
    var body: some View {
        VStack {
            HStack {
                Picker("Algorithm:", selection: $algorithmType) {
                    ForEach(AlgorithmType.allCases) {
                        Text("\($0.title)")
                            .tag($0)
                    }
                }
                .frame(width: 250)
                
                controlButton(title: "Stop") {
                    container.stopSort()
                }
                .disabled(!container.active)
                
                controlButton(title: "Start") {
                    container.startSort(algorithm: algorithmType)
                }
                .disabled(container.active)
                
                controlButton(title: "Reset") {
                    container.randomize()
                }
                .disabled(container.active)
            }
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(container.values, id: \.id) { bar in
                    Rectangle()
                        .stroke(Color.black, lineWidth: 1)
                        .background(bar.highlighted ? Color.white : Color.blue)
                        .frame(maxWidth: 10, maxHeight: CGFloat(bar.value))
                }
            }
        }
        .padding()
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    private func controlButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text("\(title)")
                .frame(width: 40)
        }
    }
}

#Preview {
    ContentView()
        .navigationTitle("Sorting Algorithm Visualizer")
        .frame(width: 500, height: 300)
}
