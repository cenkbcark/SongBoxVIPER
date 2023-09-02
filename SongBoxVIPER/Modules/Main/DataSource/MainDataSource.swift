//
//  MainDataSource.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import UIKit

final class MainDataSource: NSObject {
    typealias RowItem = MainModule.MainTableItem
    
    weak var tableView: UITableView?
    weak var presenter: MainModule.Presenter?
    
    private var items: [RowItem] = []
    
    required init (_ tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        let songCellName = String(describing: SongCell.self)
        let songCellNib = UINib(nibName: songCellName, bundle: .main)
        tableView?.register(songCellNib, forCellReuseIdentifier: songCellName)
    }
}
extension MainDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let tabItem = presenter?.tableItems.count
        else { return 0 }
        return tabItem
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = presenter?.tableItems[section]
        else { return 0 }
        
        switch tableSection {
        case .songs(model: let model):
            return model.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableSection = presenter?.tableItems[indexPath.section]
        else { return UITableViewCell() }
        
        switch tableSection {
        case .songs(model: let model):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SongCell.self)) as? SongCell {
                cell.setSong(model[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension MainDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableItems = presenter?.tableItems[indexPath.section]
        else { return }
        switch tableItems {
        case .songs(model: let songs):
            presenter?.didSelectMusic(with: songs[indexPath.row])
        }
    }
}

extension MainDataSource {
    func setItems(_ items: [RowItem]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}
