//
//  OrderDetailViewModel.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

class OrderDetailViewModel {
    
    var cellName: String?
    var cellCpf: String?
    var product:[Product] = []
    var cellPrice: String?
    var cellItem: String?
    var quantity:[Int] = []
    
    func getCellData(index: Int) -> DetailsCellData {
       return DetailsCellData(image: getProductImage(index: index),
                              quantity: getQuantity(index: index),
                              subTotalPrice: getSubtotal(index: index),
                              title: getCellTitle(index: index),
                              price: getPrice(index: index))
    }
    
    func getReduceQuantity() -> String {
        return quantity.reduce(0, +).description
    }
    
    func getSubtotal(index: Int) -> String {
        let subtotal = Double(quantity[index]) * (product[index].price ?? 0)
        return subtotal.description
    }
    
    func getQuantity(index: Int) -> String {
        return quantity[index].description
    }
    
    func getPrice(index:Int) -> String {
        return product[index].price?.description ?? ""
    }
    
    func getProductImage(index: Int) -> String {
        return product[index].imageString ?? ""
    }
    
    func getCellItem(index: Int) -> String {
        return cellItem ?? ""
    }
        
    func getCellTitle(index: Int) -> String {
        return product[index].title ?? " "
    }
    
    func numberOfRows() -> Int {
        return product.count
    }
}
