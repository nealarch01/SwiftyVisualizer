//
//  TimeInterval+Nanoseconds.swift
//  SortingAlgorithmVisualizer
//
//  Created by Neal Archival on 2/1/24.
//

import Foundation

extension TimeInterval {
    public var toNanoseconds: UInt64 {
        UInt64(self * TimeInterval(NSEC_PER_SEC))
    }
}
