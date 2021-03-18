//
//  CheckoutViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

class CheckoutViewModel {
    
    var orderTotal: String?
    var orderQuantity:[Int]?
    var orderProducts:[Product]?
    var name:String?
    var cpf:String?
    var order:[Orders] = []
    
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
        return orderTotal ?? " "
    }
    
    func getQuantity() -> String {
        return self.orderQuantity?.reduce(0, +).description ?? " "
    }
}
