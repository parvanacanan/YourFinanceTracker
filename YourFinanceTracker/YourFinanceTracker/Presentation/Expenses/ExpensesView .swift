//
//  ExpensesView 2.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//


import SwiftUI

struct ExpensesView: View {
    @State private var isShowingAddExpense = false
    
    let store: ExpensesStore
    
    var body: some View {
        
        NavigationStack {

            List {

                ForEach(store.state.expenses) { expense in

                    VStack(alignment: .leading) {

                        Text(expense.title)

                        Text(expense.transactionDescription)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("-\(expense.amount)")
                    }
                }
                .onDelete { indexSet in

                    guard let index = indexSet.first else {
                        return
                    }

                    let expense = store.state.expenses[index]

                    store.send(
                        .deleteExpense(expense.id)
                    )
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .task {
            store.send(.loadExpenses)
        }
        .sheet(isPresented: $isShowingAddExpense) {
            AddExpenseSheet { transaction in
                store.send(.addExpense(transaction))
            }
        }
    }
}
