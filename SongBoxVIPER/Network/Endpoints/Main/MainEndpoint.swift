//
//  MainEndpoint.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation

enum MainEndPoint: Endpointable {
    case music
    
    var baseUrl: String {
        return "https://rss.applemarketingtools.com/api/v2/us/"
    }
    
    var fullPath: String {
        return baseUrl + self.rawValue
    }
    
    var rawValue: String {
        switch self {
        case .music:
            return "music/most-played/50/albums.json"
        }
    }
}
