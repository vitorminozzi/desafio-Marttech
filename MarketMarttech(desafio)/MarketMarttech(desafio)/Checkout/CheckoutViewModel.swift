//
//  CheckoutViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

class CheckoutViewModel {
    
    var orderTotal: [Double]?
    var orderQuantity:[Int]?
    var orderProducts:[Product]?
    var orders:[Orders] = []
    
    func checkout(name: String?, cpf: String?) {
        
        orders.append(Orders(name: name,
                             cpf: cpf,
                             itens: getQuantity(),
                             total: getTotalString(),
                             products: orderProducts,
                             quantity: orderQuantity))
        
        if var lastOrders = LocalData.getOrders() {
            lastOrders.append(contentsOf: orders)
            LocalData.encode(toEncode: lastOrders)
        } else {
            LocalData.encode(toEncode: orders)
        }
    }
    
    func getCheckoutCellData(index: Int) -> CheckoutCellData {
        return CheckoutCellData(image: getCheckoutImage(index: index),
                                quantity: getCheckoutQuantity(index: index),
                                totalPrice: getCheckoutTotalPrice(index: index),
                                title: getCheckoutTitle(index: index))
    }
    
    func getCheckoutTitle(index: Int) -> String {
        return orderProducts?[index].title ?? ""
    }
    
    func getCheckoutTotalPrice(index: Int) -> String {
        let totalPrice = Double(orderQuantity?[index] ?? 0) * (orderProducts?[index].price ?? 0)
        return "R$\(totalPrice)"
    }
    
    func getCheckoutQuantity(index: Int) -> String {
        return "\(orderQuantity?[index] ?? 0)x"
    }
    
    func getCheckoutImage(index: Int) -> String {
        return orderProducts?[index].imageString ?? ""
    }
    
    func getNumberOfRows() -> Int {
        return orderProducts?.count ?? 0
    }
    
    func getTotalString() -> String {
        return "\(orderTotal?.reduce(0, +) ?? 0)"
    }
    
    func getQuantity() -> String {
        return self.orderQuantity?.reduce(0, +).description ?? " "
    }
}
