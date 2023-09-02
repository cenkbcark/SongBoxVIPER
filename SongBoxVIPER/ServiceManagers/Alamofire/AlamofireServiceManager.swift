//
//  AlamofireServiceManager.swift
//  SongBoxVIPER
//
//  Created by Cenk Bahadır Çark on 3.09.2023.
//

import Foundation
import Alamofire

final class AlamofireServiceManager: Networkable {
    func fetchData<T>(endPoint: Endpointable, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let components = URLComponents(string: endPoint.fullPath)
        
        guard let url = components?.url
        else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        AF.request(url).response { response in
            guard let data = response.data
            else {
                completion(.failure(NSError(domain: "No data received", code: 0)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
