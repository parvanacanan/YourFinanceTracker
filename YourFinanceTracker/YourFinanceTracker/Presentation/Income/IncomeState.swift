//
//  IncomeState.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import Foundation

struct IncomeState {
    var incomes: [Transaction] = []
    var isLoading = false
    var errorMessage: String?
}
