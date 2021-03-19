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
    
    func getCellData(index: Int) -> DetailsCellData {
       return DetailsCellData (image: getProductImage(index: index),
                               quantity: getCellItem(index: index),
                               totalPrice: getCellPrice(index: index),
                               title: getCellTitle(index: index))
    }
    
    func getProductImage(index: Int) -> String {
        return product[index].imageString ?? ""
    }
    
    func getCellItem(index: Int) -> String {
        return cellItem ?? ""
    }
    
    func getCellPrice(index: Int) -> String {
        return cellPrice ?? ""
    }
    
    func getCellTitle(index: Int) -> String {
        return cellName ?? ""
    }
    
    func numberOfRows() -> Int {
        return product.count
    }
    
}
