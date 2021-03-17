//
//  Network.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 17/03/21.
//

import Foundation

typealias completion<T> = (_ result: T,_ failure: String?) -> Void

class Network {
    
    let session = URLSession.shared
    
    func getData(completion: @escaping completion<[Product]?>) {
    
    let url: URL? = URL(string: NetworkResources.url)
    
        if let url = url {
            let task:URLSessionTask = session.dataTask(with: url) { (data, response, error) in
                
                do {
                    let productList = try JSONDecoder().decode([Product]?.self, from: data ?? Data())
                    completion(productList,nil)
                }catch {
                    print(error)
                    print("Deu erro no Parse")
                }
            }
            task.resume()
        }
}
    
}
