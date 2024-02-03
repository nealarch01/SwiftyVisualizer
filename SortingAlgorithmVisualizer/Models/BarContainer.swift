//
//  BarContainer.swift
//  SortingAlgorithmVisualizer
//
//  Created by Neal Archival on 1/31/24.
//

import Foundation
import Combine

// MARK: Algorithm Type
enum AlgorithmType: Int, CaseIterable, Identifiable {
    case bubbleSort
    case selectionSort
    case insertionSort
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .bubbleSort:
            "Bubble Sort"
        case .selectionSort:
            "Selection Sort"
        case .insertionSort:
            "Insertion Sort"
        }
    }
}

// MARK: BarContainer
class BarContainer: ObservableObject {
    private let numberOfBars: Int = 50
    
    @Published private(set) var values: [Bar]
    @Published private(set) var active: Bool
    private var pauseDuration: TimeInterval
    
    init(pauseDuration: TimeInterval = 0.01) {
        self.values = []
        self.active = false
        self.pauseDuration = pauseDuration
        for _ in 1...numberOfBars {
            self.values.append(Bar(Int.random(in: 20...250)))
        }
    }
    
    private func secondsToNanoseconds(_ seconds: TimeInterval) -> UInt64 {
        UInt64(seconds * TimeInterval(NSEC_PER_SEC))
    }
    
    @MainActor
    private func swap(_ i: Int, _ j: Int) async {
        values.swapAt(i, j)
        try? await Task.sleep(nanoseconds: pauseDuration.toNanoseconds)
    }
    
    @MainActor
    private func highlightBar(at index: Int, highlighted: Bool) async {
        values[index].setHighlighted(highlighted)
    }
    
    @MainActor
    func startSort(algorithm: AlgorithmType) {
        if active == true { return } // Prevent any changes if active is true 
        active = true
        Task {
            switch algorithm {
            case .bubbleSort:
                await bubbleSort()
            case .selectionSort:
                await selectionSort()
            case .insertionSort:
                await insertionSort()
            }
            active = false
        }
    }
    
    @MainActor
    func stopSort() {
        active = false
    }
    
    @MainActor
    func randomize() {
        if active { return }
        self.values = []
        for _ in 1...numberOfBars {
            self.values.append(Bar(Int.random(in: 20...250)))
        }
    }
    
    private func bubbleSort() async {
        let count = values.count
        for _ in 0..<count {
            if !active { return }
            for j in 0..<count - 1 {
                if !active { return }
                if values[j].value > values[j + 1].value {
                    await swap(j, j + 1)
                }
            }
        }
    }
    
    private func selectionSort() async {
        let count = values.count
        for i in 0..<(count - 1) {
            if !active { return }
            var minimumValueIndex = i
            for j in (i + 1)..<count {
                if !active { return }
                if values[j] < values[minimumValueIndex] {
                    minimumValueIndex = j
                }
            }
            if i != minimumValueIndex {
                await swap(i, minimumValueIndex)
            }
        }
    }
    
    private func insertionSort() async {
        let count = values.count
        
        for i in 1..<count {
            if !active { return }
             var j = i
             while j > 0 && values[j] < values[j - 1] {
                 if !active { return }
                 await swap(j, j - 1)
                 j -= 1
             }
         }
    }
}
