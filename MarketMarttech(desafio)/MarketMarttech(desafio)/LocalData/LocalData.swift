//
//  LocalData.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

class LocalData {
    
    static let userDefault = UserDefaults.standard
    static let ordersKey = "orders"
    
  class func encode(toEncode: [Orders]) {
    userDefault.removeObject(forKey: ordersKey)
        do {
            
            let encoder = JSONEncoder()
            let data = try encoder.encode(toEncode)
            userDefault.setValue(data, forKey: ordersKey)
        }catch {
            return
        }
    }
    
   class func getOrders() -> [Orders]? {
        if let data = userDefault.data(forKey: ordersKey) {
            
            do {
                let decoder = JSONDecoder()
                let orders = try decoder.decode([Orders].self, from: data)
                return orders
            } catch {
                return nil
            }
        }
        return nil
    }

    
}
