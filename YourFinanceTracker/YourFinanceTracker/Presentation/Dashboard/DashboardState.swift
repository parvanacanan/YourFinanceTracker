//
//  DashboardState.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//

import Foundation

struct DashboardState {
    var totalIncome: Double = 0
    var totalExpense: Double = 0
    var balance: Double = 0

    var isLoading = false
    var errorMessage: String?
}
