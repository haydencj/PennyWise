//
//  FinanceViewModel.swift
//  PennyWise
//
//  Created by Hayden Johnson on 4/11/25.
//

import Foundation
import Combine

// This class acts as the ViewModel for our finance tracking dashboard.
// It connects our model (SpendingMetrics) with our Views by managing data.

// final keyword in Swift is used before a class declaration to indicate that the class cannot be subclassed. This means no other class can inherit from it.
final class FinanceViewModel: ObservableObject {
    // @Published tells SwiftUI to update any view that is observing this property.
    @Published var metrics = SpendingMetrics(spentToday: 0, spentThisWeek: 0, spentThisMonth: 0)
    
    // Initialization starts data fetching.
    init() {
        fetchSpendingData()
    }
    
    /// Simulates fetching spending data with a delay.
    /// Later, you will replace this with actual API calls or local persistence data.
    private func fetchSpendingData() {
        // Simulate a network delay (1 second) before updating metrics.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.metrics = SpendingMetrics(
                spentToday: 42.50,
                spentThisWeek: 300.75,
                spentThisMonth: 1200.00
            )
        }
    }
}
