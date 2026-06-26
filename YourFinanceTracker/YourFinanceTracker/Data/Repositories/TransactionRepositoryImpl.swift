//
//  TransactionRepositoryImpl.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//

import Foundation

final class TransactionRepositoryImpl: TransactionRepository {

    private var transactions: [Transaction] = []

    func fetchTransactions() async throws -> [Transaction] {
        transactions
    }

    func addTransaction(_ transaction: Transaction) async throws {
        transactions.append(transaction)
    }

    func deleteTransaction(id: UUID) async throws {
        transactions.removeAll { $0.id == id }
    }
}
