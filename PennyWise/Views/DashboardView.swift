//
//  DashboardView.swift
//  PennyWise
//
//  Created by Hayden Johnson on 4/11/25.
//
import SwiftUI

struct DashboardView: View {
    // Use @StateObject because DashboardView creates and owns this instance.
    @StateObject var viewModel = FinanceViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                MetricView(title: "Spent Today", amount: viewModel.metrics.spentToday)
                MetricView(title: "Spent This Week", amount: viewModel.metrics.spentThisWeek)
                MetricView(title: "Spent This Month", amount: viewModel.metrics.spentThisMonth)
            }
            .padding()
            .navigationTitle("PennyWise")
        }
    }
}

// A reusable view that displays a single spending metric.
struct MetricView: View {
    let title: String
    let amount: Double
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                // The accessibilityLabel makes it easier for VoiceOver users.
                .accessibilityLabel(title)
            Text(String(format: "$%.2f", amount))
                .font(.title)
                .accessibilityLabel("Amount \(String(format: "$%.2f", amount))")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(12)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
