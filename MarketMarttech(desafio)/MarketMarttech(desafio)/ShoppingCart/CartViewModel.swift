//
//  CartViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import Foundation

protocol CartViewModelDelegate: class {
    
    func quantityArray(array: [Int])
    func priceArray(arru: [Double])
}

class CartViewModel {
    
    var cartProduct: [Product] = []
    var cartQuantity: [Int] = []
    var plusCount: Int?
    var minusCount: Int?
    var totalPrice: [Double]?
    var deletedIndex: Int = 0
    weak var delegate: CartViewModelDelegate?

    func getCartCellData(index: Int) -> CartCell {
        
        return CartCell(image: getCartImage(index: index),
                        quantity: getQuantity(index: index),
                        price: getCartPrice(index: index),
                        title: getCartTitles(index: index),
                        totalPrice: getTotalPrice(index: index),
                        description:getDescription(index: index))
    }
    
    func getTotalOrderPrice() -> Double {
        return totalPrice?.reduce(0, +) ?? 0
    }
    
    func getCartTitles(index: Int) -> String {
        return cartProduct[index].title ?? ""
    }
    
    func getCartPrice(index: Int) -> String {
        return "R$\(String(cartProduct[index].price ?? 0))"
    }
    
    func getOriginalQuantity(index: Int) -> Int {
        return cartQuantity[index]
    }
    
    func getQuantity(index: Int) -> String {
   
         return String(cartQuantity[index])
    }
    
    func getDoubleTotalPrice(index:Int) -> Double {
        let totalPrice = self.getDoubleNumber(int: cartQuantity[index]) * (cartProduct[index].price ?? 0)
        return totalPrice
    }
    
    func getTotalPrice(index: Int) -> String {
        let totalPrice = self.getDoubleNumber(int: cartQuantity[index]) * (cartProduct[index].price ?? 0)
        return "R$\(totalPrice.description)"
    }
    
    func getDoubleNumber(int : Int) -> Double {
        let double = Double(int)
        return double
    }

    func getCartImage(index: Int) -> String {
        return cartProduct[index].imageString ?? ""
        
}
    func getDescription(index: Int) -> String {
        return cartProduct[index].description ?? ""
    }
    
    func getReduceTotalQuantity() -> Int {
        return cartQuantity.reduce(0, +)
    }

}
