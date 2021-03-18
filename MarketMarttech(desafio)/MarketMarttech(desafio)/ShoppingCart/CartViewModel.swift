//
//  CartViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import Foundation

class CartViewModel {
    
    var cartProducts:[Product]?
    var numberOfProducts:[Int]?
    var view = CartViewController()

    func getCartCellData(index: Int) -> CartCell {
        return CartCell(image: self.getCartImage(index: index),
                        quantity: self.getQuantity(index: index),
                        price: self.getCartPrice(index: index),
                        title: self.getCartTitles(index: index),
                        totalPrice: self.getTotalPrice(index: index))
    }
    
    func getCartTitles(index: Int) -> String {
        return view.recipeProducts[index].title ?? ""
    }
    
    func getCartPrice(index: Int) -> String {
        return String(view.recipeProducts[index].price ?? 0)
    }
    
    func getQuantity(index: Int) -> String {
        return String(view.recipeQuantity[index])
    }
    
    func getTotalPrice(index: Int) -> String {
        let totalPrice = self.getDoubleNumber(int: view.recipeQuantity[index]) * (view.recipeProducts[index].price ?? 0)
        return totalPrice.description
    }
    
    func getDoubleNumber(int : Int) -> Double {
        let double = Double(int)
        return double
    }

    func getCartImage(index: Int) -> String {
        return view.recipeProducts[index].imageString ?? ""
        
}

}
