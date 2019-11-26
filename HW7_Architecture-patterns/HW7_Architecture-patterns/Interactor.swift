//
//  Interactor.swift
//  HW7_Architecture-patterns
//
//  Created by Roman Cheremin on 09/11/2019.
//  Copyright © 2019 Daria Cheremina. All rights reserved.
//

import UIKit

class Interactor {
    var networkServece: NetworkServiceProtocol?
    var imageModel = ImageStore()
    var output: PresenterOutputProtocol?
}

protocol InteractorInputProtocol {
    func getImage()
    func displayImage()
    func deleteImage()
}

protocol InteractorOutputProtocol {
//    func alertMessage(message: String)
}

extension Interactor: InteractorInputProtocol {
    func getImage() {
        
        var alertMessage = ""
        
        networkServece?.downloadImage { image, error in
            DispatchQueue.main.async {
                
                guard let image = image else {
                    alertMessage = "\(String(describing: error!.localizedDescription))"
                    return
                }
                
                self.imageModel.image = image
                alertMessage = "Картинка скачана"
                self.output?.prepareAlert(with: alertMessage)
            }
        }
    }
}


extension Interactor: InteractorOutputProtocol {
    
    func displayImage() {
        guard let image = imageModel.image else {
            self.output?.prepareAlert(with: "Картинка не загружена")
            return
        }
        self.output?.prepareImage(image: image)
    }
    
    func deleteImage() {
        self.imageModel.image = nil
        self.output?.prepareImage(image: UIImage(named: "ShowImage")!)
        self.output?.prepareAlert(with: "Кэш очищен!")
    }
    
}
