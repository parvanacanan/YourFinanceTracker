//
//  DashboardStore.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import Foundation
import Observation

@Observable
final class DashboardStore {

    var state = DashboardState()

    private let repository: TransactionRepository

    init(repository: TransactionRepository) {
        self.repository = repository
    }

    func send(_ intent: DashboardIntent) {
        switch intent {

        case .loadDashboard:
            Task {
                await loadDashboard()
            }
        }
    }

    @MainActor
    private func loadDashboard() async {

        state.isLoading = true

        do {

            let transactions =
                try await repository.fetchTransactions()

            let incomes = transactions.filter {
                $0.type == .income
            }

            let expenses = transactions.filter {
                $0.type == .expense
            }

            state.totalIncome =
                incomes.reduce(0) {
                    $0 + $1.amount
                }

            state.totalExpense =
                expenses.reduce(0) {
                    $0 + $1.amount
                }

            state.balance =
                state.totalIncome -
                state.totalExpense

        } catch {

            state.errorMessage =
                error.localizedDescription
        }

        state.isLoading = false
    }
}
