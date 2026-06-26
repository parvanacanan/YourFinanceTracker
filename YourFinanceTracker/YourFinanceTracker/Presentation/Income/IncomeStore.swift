//
//  IncomeStore.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import Foundation
import Observation

@Observable
final class IncomeStore {

    var state = IncomeState()

    private let repository: TransactionRepository

    init(repository: TransactionRepository) {
        self.repository = repository
    }

    func send(_ intent: IncomeIntent) {
        switch intent {

        case .loadIncomes:
            Task {
                await loadIncomes()
            }

        case .addIncome(let transaction):
            Task {
                try? await repository.addTransaction(transaction)
                await loadIncomes()
            }

        case .deleteIncome(let id):
            Task {
                try? await repository.deleteTransaction(id: id)
                await loadIncomes()
            }
        }
    }

    @MainActor
    private func loadIncomes() async {

        state.isLoading = true

        do {

            let transactions = try await repository.fetchTransactions()

            state.incomes = transactions.filter {
                $0.type == .income
            }

            state.errorMessage = nil

        } catch {
            state.errorMessage = error.localizedDescription
        }

        state.isLoading = false
    }
}
