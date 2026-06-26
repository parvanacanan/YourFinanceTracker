//
//  ExpensesIntent.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//

import Foundation
enum ExpensesIntent {
    case addExpense(Transaction)
    case deleteExpense(UUID)
    case loadExpenses
}
