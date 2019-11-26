//
//  NetworkServece.swift
//  HW7_Architecture-patterns
//
//  Created by Roman Cheremin on 09/11/2019.
//  Copyright © 2019 Daria Cheremina. All rights reserved.
//

import UIKit

protocol NetworkServiceProtocol: class {
    
    func downloadImage(completion: @escaping (UIImage?, Error?) -> Void)
}

class NetworkService: NSObject, NetworkServiceProtocol {
    
    func downloadImage(completion: @escaping (UIImage?, Error?) -> Void) {
        guard let url = URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBYWuoXXUiOlePpzGN-vtJZBFOFuZ78OKBUbl-OFJK8RDEfmlZ&s") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let currentError = error {
                completion(nil, currentError)
                return
            }
            
            guard let currentData = data else { return }
            let image = UIImage(data: currentData)
            completion(image, nil)
        }
        
        task.resume()
    }
}
