//
//  ExpensesState 2.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 17.06.26.
//


import Foundation

struct ExpensesState {
    var expenses: [Transaction] = []
    var isLoading = false
    var errorMessage: String?
}