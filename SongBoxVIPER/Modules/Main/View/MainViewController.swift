//
//  MainViewController.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import UIKit

protocol MainViewProtocol {
    var presenter: MainModule.Presenter? { get set }
    func updateTableView(with model: [MainModule.MainTableItem])
}

final class MainViewController: UIViewController, MainViewProtocol {
    var presenter: MainModule.Presenter?
    private var dataSource: MainDataSource!
    private var tableItems: [MainModule.MainTableItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupDataSource()
    }
    
    private func setupDataSource() {
        dataSource = .init(tableView)
        dataSource.presenter = presenter
    }
    
    func updateTableView(with model: [MainModule.MainTableItem]) {
        tableItems = model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
