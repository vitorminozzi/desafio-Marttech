//
//  OrderDetailViewController.swift
//  MarketMarttech(desafio)
//
//  Created by Vitor Gomes on 18/03/21.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var itensLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var cpfTextLabel: UILabel!
    @IBOutlet weak var itensTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
