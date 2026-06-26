//
//  IncomeView.swift
//  YourFinanceTracker
//
//  Created by Parvana Jananova on 25.06.26.
//



import SwiftUI

struct IncomeView: View {
    @State private var isShowingAddIncome = false
    
    let store: IncomeStore
    
    var body: some View {
        
        NavigationStack {

            List {

                ForEach(store.state.incomes) { income in

                    VStack(alignment: .leading) {

                        Text(income.title)

                        Text(income.transactionDescription)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("-\(income.amount)")
                    }
                }
                .onDelete { indexSet in

                    guard let index = indexSet.first else {
                        return
                    }

                    let income = store.state.incomes[index]

                    store.send(
                        .deleteIncome(income.id)
                    )
                }
            }
            .navigationTitle("Incomes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddIncome = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .task {
            store.send(.loadIncomes)
        }
        .sheet(isPresented: $isShowingAddIncome) {
            AddIncomeSheet { transaction in
                store.send(.addIncome(transaction))
            }
        }
    }
}
