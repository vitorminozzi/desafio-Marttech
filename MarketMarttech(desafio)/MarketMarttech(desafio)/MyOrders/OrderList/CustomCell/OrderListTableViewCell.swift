//
//  OrderListTableViewCell.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var cpfTextLabel: UILabel!
    @IBOutlet weak var itensTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var itensLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    func setupCell(withData: OrderCellData) {
        
        self.nameLabel.text = withData.name
        self.cpfLabel.text = withData.cpf
        self.itensLabel.text = withData.itens
        self.totalLabel.text = withData.total
    }
    
}
