//
//  Endpointable.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation

protocol Endpointable {
    var baseUrl: String { get }
    var fullPath: String { get }
}
