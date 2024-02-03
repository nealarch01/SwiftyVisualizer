//
//  SortingAlgorithmVisualizerTests.swift
//  SortingAlgorithmVisualizerTests
//
//  Created by Neal Archival on 2/1/24.
//

import XCTest
@testable import SortingAlgorithmVisualizer

@MainActor
final class SortingAlgorithmVisualizerTests: XCTestCase {
    var barContainer: BarContainer!
    
    override func setUp() {
        super.setUp()
        barContainer = BarContainer(pauseDuration: .zero)
    }
    
    override func tearDown() {
        barContainer = nil
        super.tearDown()
    }
    
    func testBubbleSort() {
        let expectedValues = barContainer.values.sorted { $0 < $1 }
        barContainer.startSort(algorithm: .bubbleSort)
        let sortedValues = barContainer.values
        XCTAssertTrue(expectedValues == sortedValues)
    }
    
    func testSelectionSort() {
        let expectedValues = barContainer.values.sorted { $0 < $1 }
        barContainer.startSort(algorithm: .selectionSort)
        let sortedValues = barContainer.values
        XCTAssertTrue(expectedValues == sortedValues)
    }
    
    func testInsertionSort() {
        let expectedValues = barContainer.values.sorted { $0 < $1 }
        barContainer.startSort(algorithm: .insertionSort)
        let sortedValues = barContainer.values
        XCTAssertTrue(expectedValues == sortedValues)
    }
}

extension [Bar] {
    static public func == (lhs: [Bar], rhs: [Bar]) -> Bool {
        if lhs.count != rhs.count {
            return false
        }
        for i in 0..<lhs.count {
            if lhs[i] == rhs[i] {
                return false
            }
        }
        return true
    }
}
