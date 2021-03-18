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

    func getCartCellData(index: Int) -> CartCell {
        return CartCell(image: self.cartImageString(index: index),
                        quantity: self.getQuantity(index: index),
                        price: self.getCartPrice(index: index),
                        title: self.getCartTitles(index: index),
                        totalPrice: self.getTotalPrice(index: index))
    }
    
    func getCartTitles(index: Int) -> String {
        return cartProducts?[index].title ?? ""
    }
    
    func getCartPrice(index: Int) -> String {
        return String(cartProducts?[index].price ?? 0.0)
    }
    
    func getQuantity(index: Int) -> String {
        return String(numberOfProducts?[index] ?? 0)
    }
    
    func getTotalPrice(index: Int) -> String {
        let totalPrice = self.getDoubleNumber(int: numberOfProducts?[index] ?? 0) * (self.cartProducts?[index].price ?? 0.0)
        return totalPrice.description
    }
    
    func getDoubleNumber(int : Int) -> Double {
        let double = Double(int)
        return double
    }

    func cartImageString(index: Int) -> String {
            switch self.cartProducts?[index].id {
            case 0:
                return "batatafrita"
            case 1:
                return "cheeseburger"
            case 2:
                return "sucodelaranja"
            case 3:
                return "sucodemelancia"
            case 4:
                return "cebolacrispy"
            case 5:
                return "cremedepapaya"
            case 6:
                return "petitgateau"
            case 7:
                return "agua"
            default:
                print("id nao encontrado")
            }
            return "N/A"
        }
        
}

