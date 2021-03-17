//
//  CartViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import Foundation

class CartViewModel {
    
    var cartProducts:[Product]?

//    func getCartCellData(index: Int) -> CartCell {
//        return CartCell(image: <#T##String?#>,
//                        quantity: <#T##String?#>,
//                        totalPrice: <#T##String?#>,
//                        title: <#T##String?#>)
    
    
    func getCartTitles(index: Int) -> String {
        return cartProducts?[index].title ?? ""
    }

}
