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
    weak var delegate:ProductListViewModelDelegate?
    var currentIndex = 0
    var modelCount = 0
    
    func getProductList() {
        
        self.network.getData { (success, error) in
            
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
    
//    func prepareImageString(index: Int) -> String {
//        switch self.productList?[index].id {
//        case 0:
//            return "batatafrita"
//        case 1:
//            return "cheeseburger"
//        case 2:
//            return "sucodelaranja"
//        case 3:
//            return "sucodemelancia"
//        case 4:
//            return "cebolacrispy"
//        case 5:
//            return "cremedepapaya"
//        case 6:
//            return "petitgateau"
//        case 7:
//            return "agua"
//        default:
//            print("id nao encontrado")
//        }
//        return "N/A"
//    }
    
    func getId(index: Int) -> Int {
        return productList?[index].id ?? 0
    }
}
