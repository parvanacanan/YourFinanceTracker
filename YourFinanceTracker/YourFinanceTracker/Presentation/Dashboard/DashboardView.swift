//
//  DashboardView.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import SwiftUI

struct DashboardView: View {

    let store: DashboardStore

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Balance")
                    .font(.headline)

                Text(
                    "\(store.state.balance)"
                )
                .font(.largeTitle)

                Divider()

                Text(
                    "Income: \(store.state.totalIncome)"
                )

                Text(
                    "Expense: \(store.state.totalExpense)"
                )
            }
            .navigationTitle("Dashboard")
        }
        .task {
            store.send(.loadDashboard)
        }
    }
}
