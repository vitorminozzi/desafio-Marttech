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
    var currentIndex = 0
    var refreshOrders:[Orders] = []
    
    func getOrders() {
        orders = LocalData.getOrders() ?? []
    }
    
    func getOrdersCellData(index: Int) -> OrderCellData? {
        return OrderCellData(name: getOrdersListName(index: index),
                             cpf: getOrdersListCpf(index: index),
                             itens: getReduceQuantity(index: index),
                             total: getOrderListTotal(index: index))
    }
    
    
    func getReduceQuantity(index: Int) -> String {
        return orders[index].quantity?.reduce(0, +).description ?? ""
    }
    
    func getEachQuantity(index: Int) -> [Int] {
        return orders[index].quantity ?? []
    }
    
    func getProducts(index: Int) -> [Product] {
        return orders[index].products ?? []
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
    
    func filterByName(name: String) -> [Orders] {
        let filterOrders = orders.filter{$0.name == name}
        print(filterOrders)
        return filterOrders
    }
    
    
}

