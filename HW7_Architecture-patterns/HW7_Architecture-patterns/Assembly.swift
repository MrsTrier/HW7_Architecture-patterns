//
//  Assembly.swift
//  HW7_Architecture-patterns
//
//  Created by Roman Cheremin on 11/11/2019.
//  Copyright © 2019 Daria Cheremina. All rights reserved.
//

import UIKit

class Assembly {
    static func viewController() -> ViewController {
        let vc = ViewController()
        let presenter = Presenter()
        let interactor = Interactor()
        
        interactor.networkServece = NetworkService()
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.viewController = vc
        vc.presenter = presenter
        
        return vc
    }
}

