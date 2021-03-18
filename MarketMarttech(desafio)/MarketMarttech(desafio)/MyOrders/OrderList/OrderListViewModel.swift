//
//  OrderListViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

class OrderListViewModel {
    
    var orders:[Orders]?
    
    func getOrdersCellData(index: Int) -> OrderCellData? {
        return OrderCellData(name: getOrdersListName(index: index),
                             cpf: getOrdersListCpf(index: index),
                             itens: getOrderListItens(index: index),
                             total: getOrderListTotal(index: index))
    }
    
    func getOrdersListName(index: Int) -> String {
        return orders?[index].name ?? ""
    }
    
    func getOrdersListCpf(index: Int) -> String {
        return orders?[index].cpf ?? ""
    }
    
    func getOrderListItens(index: Int) -> String {
        return orders?[index].itens ?? ""
    }
    
    func getOrderListTotal(index: Int) -> String {
        return orders?[index].total ?? ""
    }
    
    func numberOfRows() -> Int {
        orders?.count ?? 0
    }
}
