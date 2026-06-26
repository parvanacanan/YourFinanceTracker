//
//  ExpensesStore.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//

import Foundation
import Observation
@Observable
final class ExpensesStore  {
    var state = ExpensesState()
    
    private let repository: TransactionRepository

        init(repository: TransactionRepository) {
            self.repository = repository
        }
    
    func send(_ intent: ExpensesIntent) {
        switch intent {

        case .loadExpenses:
            Task {
                await loadExpenses()
            }

        case .addExpense(let transaction):
            Task {
                try? await repository.addTransaction(transaction)
                await loadExpenses()
            }

        case .deleteExpense(let id):
            Task {
                try? await repository.deleteTransaction(id: id)
                await loadExpenses()
            }
        }
    }
    @MainActor
    private func loadExpenses() async {

        state.isLoading = true

        do {
            let transactions = try await repository.fetchTransactions()

            state.expenses = transactions.filter {
                $0.type == .expense
            }

            state.errorMessage = nil

        } catch {
            state.errorMessage = error.localizedDescription
        }

        state.isLoading = false
    }

}
