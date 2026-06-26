//
//  Transaction.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//
import Foundation

struct Transaction: Identifiable, Equatable {
    let id: UUID
    let title: String
    let transactionDescription: String
    let amount: Double
    let date: Date
    let type: TransactionType
}

enum TransactionType {
    case income
    case expense
}
 
