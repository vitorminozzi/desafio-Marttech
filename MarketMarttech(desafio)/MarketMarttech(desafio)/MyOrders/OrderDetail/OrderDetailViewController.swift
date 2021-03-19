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
    
    var viewModel = OrderDetailViewModel()
    var recipeName = ""
    var recipeCpf = ""
    var recipePrice = ""
    var recipeItems = ""
    var recipeProducts:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.cellName = recipeName
        viewModel.cellCpf = recipeCpf
        viewModel.cellPrice = recipePrice
        viewModel.product = recipeProducts
        nameLabel.text = viewModel.cellName
        cpfLabel.text = viewModel.cellCpf
        priceLabel.text = viewModel.cellPrice
        
        self.detailsTableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
}

extension OrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as? DetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(withData: viewModel.getCellData(index: indexPath.row))
        return cell
    }
}
