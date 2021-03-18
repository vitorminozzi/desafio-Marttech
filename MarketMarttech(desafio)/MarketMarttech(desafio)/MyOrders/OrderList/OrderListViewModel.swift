//
//  OrderListViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

class OrderListViewModel {
    
    var orders:[Orders] = []
    let userDefault = UserDefaults.standard
    
    func getOrders() {
        if let data = userDefault.data(forKey: "orders") {
            
            do {
                let decoder = JSONDecoder()
                let orders = try decoder.decode([Orders].self, from: data)
                self.orders = orders
            } catch {
                print("Falha ao decodificar")
            }
            print(orders)
        }
    }
        
        func getOrdersCellData(index: Int) -> OrderCellData? {
            return OrderCellData(name: getOrdersListName(index: index),
                                 cpf: getOrdersListCpf(index: index),
                                 itens: getOrderListItens(index: index),
                                 total: getOrderListTotal(index: index))
        }
        
        func getOrdersListName(index: Int) -> String {
            return orders[index].name ?? ""
        }
        
        func getOrdersListCpf(index: Int) -> String {
            return orders[index].cpf ?? ""
        }
        
        func getOrderListItens(index: Int) -> String {
            return orders[index].itens ?? ""
        }
        
        func getOrderListTotal(index: Int) -> String {
            return orders[index].total
        }
        
        func numberOfRows() -> Int {
            orders.count
        }
    
    }

