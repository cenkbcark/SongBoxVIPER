//
//  MainInteractor.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation

protocol MainInteractorProtocol {
    var presenter: MainModule.Presenter? { get set }
    
    func fetchSongs()
}

final class MainInteractor: MainInteractorProtocol {
    var presenter: MainModule.Presenter?
    
    private var serviceManager: Networkable
    
    init(serviceManager: Networkable) {
        self.serviceManager = serviceManager
    }
    
    func fetchSongs() {
        let mainEndPoint: MainEndPoint = .music
        serviceManager.fetchData(endPoint: mainEndPoint) { (result: Result<MostPlayedSongResponse, Error>) in
            switch result {
            case .success(let success):
                guard let songs = success.feed?.results
                else { return }
                self.presenter?.didFetchSongs(with: songs)
            case .failure(_):
                self.presenter?.fetchError()
            }
        }
    }
    
    
}
