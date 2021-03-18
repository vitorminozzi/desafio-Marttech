//
//  Orders.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

struct Orders: Codable {
    
    var name: String?
    var cpf: String?
    var itens: String?
    var total: String
    var products: [Product]?
}
