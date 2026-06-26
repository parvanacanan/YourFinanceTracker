//
//  IncomeIntent.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import Foundation

enum IncomeIntent {
    case loadIncomes
    case addIncome(Transaction)
    case deleteIncome(UUID)
}
