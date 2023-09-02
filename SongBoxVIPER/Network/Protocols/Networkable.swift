//
//  Networkable.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation

protocol Networkable {
    func fetchData<T: Decodable>(endPoint: Endpointable, completion: @escaping (Result<T, Error>) -> Void)
}
