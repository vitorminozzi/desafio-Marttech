//
//  ProductListViewMode.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import Foundation

class ProductListViewModel {
    
  var network = Network()
  var productList: [Product]?
  
    func getProductList() {
        
        self.network.getData { (success, error) in
            
            if error == nil{
                
                self.productList = success
            }else{
                print(error)
                print("falha ao popular productList")
            }
        }
    }
    
}
