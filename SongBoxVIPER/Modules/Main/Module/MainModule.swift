//
//  MainModule.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation

struct MainModule {
    typealias View = MainViewProtocol
    typealias Interactor = MainInteractorProtocol
    typealias Presenter = MainPresenterProtocol
    typealias Router = MainRouterProtocol
}

extension MainModule {
    enum MainTableItem {
        case songs(model: [MusicModel])
    }
}
