//
//  ProductListViewMode.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import Foundation

protocol ProductListViewModelDelegate: class {
    func successGetProduct(success: Bool)
}

class ProductListViewModel {
    
    var network = Network()
    var productList: [Product]?
    var selectedPrice: [Double] = []
    var selectedQuantity: [Int] = []
    var selectedProducts: [Product] = []
    weak var delegate: ProductListViewModelDelegate?
    var currentIndex = 0
    var modelCount = 0
    
    func getProductList() {
        self.network.getData { success, error in
            
            if error == nil{
                self.productList = success
                self.delegate?.successGetProduct(success: true)
            }else{
                print(error)
                print("falha ao popular productList")
            }
        }
    }
    
    func getCellData(index: Int) -> CellData{
        return CellData(title: self.getProductTitle(index: index),
                        description: self.getDescription(index: index),
                        price: self.getProductPrice(index: index),
                        image: self.getImageString(index: index))
    }
    
    func getSelectedTotalPrice(index: Int) -> Double {
        return Double(self.modelCount) * (productList?[index].price ?? 0)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return productList?.count ?? 0
    }
    
    func getProductTitle(index: Int) -> String {
        return self.productList?[index].title ?? ""
    }
    
    func getDescription(index: Int) -> String {
        return self.productList?[index].description ?? ""
    }
    
    func getProductPrice(index: Int) -> String {
        return "R$" + String(self.productList?[index].price ?? 0.0)
    }
    
    func getOriginalPrice(index: Int) -> Double {
        return self.productList?[index].price ?? 0.0
    }
    
    func getImageString(index: Int) -> String {
        return self.productList?[index].imageString ?? ""
    }
    
    func getId(index: Int) -> Int {
        return productList?[index].id ?? 0
    }
}
