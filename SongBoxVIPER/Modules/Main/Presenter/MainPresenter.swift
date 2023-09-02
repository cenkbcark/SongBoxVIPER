//
//  MainPresenter.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var view: MainModule.View? { get set }
    var interactor: MainModule.Interactor? { get set }
    var router: MainModule.Router? { get set }
    var tableItems: [MainModule.MainTableItem] { get set }
    
    func viewDidLoad()
    func didFetchSongs(with model: [MusicModel])
    func didSelectMusic(with model: MusicModel)
    func fetchError()
}

final class MainPresenter: MainPresenterProtocol {
    var view: MainModule.View?
    var interactor: MainModule.Interactor?
    var router: MainModule.Router?
    var tableItems: [MainModule.MainTableItem] = [] 
    
    func viewDidLoad() {
        interactor?.fetchSongs()
    }
    
    func didFetchSongs(with model: [MusicModel]) {
        tableItems.append(.songs(model: model))
        view?.updateTableView(with: tableItems)
    }
    
    func didSelectMusic(with model: MusicModel) {
        router?.openURL(with: model)
    }
    
    func fetchError() {
        //Error handling.
    }
}
