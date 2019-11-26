//
//  Presenter.swift
//  HW7_Architecture-patterns
//
//  Created by Roman Cheremin on 09/11/2019.
//  Copyright © 2019 Daria Cheremina. All rights reserved.
//

import UIKit

class Presenter {
    var interactor: InteractorInputProtocol?

    weak var viewController: ViewController?
}

protocol PresenterInputProtocol {
    func downloadImg()
    func showImage()
    func deleteImage()
}


protocol PresenterOutputProtocol {
    func prepareAlert(with text: String)
    func prepareImage(image: UIImage)
}

extension Presenter: PresenterInputProtocol {
    func downloadImg() {
        interactor?.getImage()
    }
    
    func showImage() {
        interactor?.displayImage()
    }
    
    func deleteImage() {
        interactor?.deleteImage()
    }
}

extension Presenter: PresenterOutputProtocol {
    
    func prepareAlert(with text: String) {
        let alertController = UIAlertController(title: "Статус загрузки", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        let retry = UIAlertAction(title: "Скачать картинку снова", style: .default, handler: { (action: UIAlertAction) in self.interactor?.getImage()})
        alertController.addAction(retry)

        self.viewController?.showAlert(controller: alertController)
        
    }
    
    func prepareImage(image: UIImage) {
        viewController?.showImage(image: image)
    }
}
