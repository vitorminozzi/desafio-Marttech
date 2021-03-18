//
//  Pedidos.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import Foundation

struct Pedidos: Codable {
    
    var name: String?
    var cpf: String?
    var products: [Product]?
}
