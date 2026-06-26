//
//  TransactionRepository.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//
import Foundation
protocol TransactionRepository {

    func fetchTransactions() async throws -> [Transaction]

    func addTransaction(_ transaction: Transaction) async throws

    func deleteTransaction(id: UUID) async throws
}
