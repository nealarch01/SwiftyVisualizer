//
//  Bar.swift
//  SortingAlgorithmVisualizer
//
//  Created by Neal Archival on 1/31/24.
//

import Foundation
import Combine

struct Bar: Identifiable {
    private(set) var id: UUID = UUID()
    private(set) var value: Int
    private(set) var highlighted: Bool = false
    
    init(_ value: Int) {
        self.value = value
    }
}

extension Bar: Equatable {
    mutating func setHighlighted(_ highlighted: Bool) {
        self.highlighted = highlighted
    }
    
    static func ==(lhs: Bar, rhs: Bar) -> Bool {
        lhs.value == rhs.value
    }
    
    static func !=(lhs: Bar, rhs: Bar) -> Bool {
        lhs.value != rhs.value
    }
    
    static func <(lhs: Bar, rhs: Bar) -> Bool {
        lhs.value < rhs.value
    }
    
    static func <=(lhs: Bar, rhs: Bar) -> Bool {
        lhs.value <= rhs.value
    }
    
    static func >(lhs: Bar, rhs: Bar) -> Bool {
        lhs.value > rhs.value
    }
    
    static func >=(lhs: Bar, rhs: Bar) -> Bool {
        lhs.value >= rhs.value
    }
}
