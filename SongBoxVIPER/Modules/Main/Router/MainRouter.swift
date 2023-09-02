//
//  MainRouter.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import UIKit

protocol MainRouterProtocol {
    func openURL(with url: MusicModel)
}

final class MainRouter: MainRouterProtocol {
    weak var presenterVC: UIViewController?
    
    func openURL(with model: MusicModel) {
        guard let url = URL(string: model.url) else { return }
        UIApplication.shared.open(url) { success in
            if success {
                print("The URL was delivered successfully.")
            } else {
                print("The URL failed to open.")
            }
        }
    }
}
