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
////let session: URLSession = URLSession.shared
//// GET MOVIE BY ID
//
//func getData(movieID: String, completion: @escaping completion<Movies?>) {
//
//    let url: URL? = URL(string: NetworkResources.url + movieID + NetworkResources.prepareKey + NetworkResources.apiKey)
//
//    if let url = url {
//        let task: URLSessionTask = session.dataTask(with: url) { data, response, error in
//
//            do {
//                let movie = try JSONDecoder().decode(Movies.self, from: data ?? Data())
//                completion(movie, nil)
//            }catch{
//                print(error.localizedDescription)
//                print(error)
//                completion(nil, "Falha no parse")
//            }
//        }
//        task.resume()
//    }
//}
