//
//  ViewController.swift
//  HW7_Architecture-patterns
//
//  Created by Roman Cheremin on 03/11/2019.
//  Copyright © 2019 Daria Cheremina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectors()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    var presenter: PresenterInputProtocol?
//    var interactor: CleanSwiftBusinessLogic?
//    var router: (NSObjectProtocol & CleanSwiftRoutingLogic & CleanSwiftDataPassing)?
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.frame = CGRect(x: view.frame.minX + 30 , y: view.frame.minY + 100, width: 360, height: 360)
        imageView.image = UIImage(named: "ShowImage")
        return imageView
    }()
    
    lazy var downloadButton: UIButton = {
        var downloadButton = UIButton()
        downloadButton.frame = CGRect(x: imageView.frame.minX + 5 , y: view.frame.minY + 140 + imageView.frame.height, width: 350, height: 50)
        downloadButton.backgroundColor = UIColor.white
        downloadButton.setTitle("Скачать картинку", for: .normal)
        downloadButton.setTitleColor(UIColor(red:0.49, green:0.50, blue:0.53, alpha:1.0), for: .normal)
        downloadButton.layer.cornerRadius = downloadButton.frame.height / 2
        return downloadButton
    }()
    
    lazy var setButton: UIButton = {
        var setButton = UIButton()
        setButton.frame = CGRect(x: imageView.frame.minX + 5 , y: view.frame.minY + 140 + imageView.frame.height + downloadButton.frame.height + 20, width: 350, height: 50)
        setButton.backgroundColor = UIColor.white
        setButton.setTitle("Загрузить картинку", for: .normal)
        setButton.setTitleColor(UIColor(red:0.49, green:0.50, blue:0.53, alpha:1.0), for: .normal)
        setButton.layer.cornerRadius = setButton.frame.height / 2
        return setButton
    }()
    
    lazy var cleanButton: UIButton = {
        var cleanButton = UIButton()
        cleanButton.frame = CGRect(x: imageView.frame.minX + 5 , y: view.frame.minY + 140 + imageView.frame.height + downloadButton.frame.height + setButton.frame.height + 40, width: 350, height: 50)
        cleanButton.backgroundColor = UIColor.white
        cleanButton.setTitle("Очистить кэш", for: .normal)
        cleanButton.setTitleColor(UIColor(red:0.49, green:0.50, blue:0.53, alpha:1.0), for: .normal)
        cleanButton.layer.cornerRadius = cleanButton.frame.height / 2
        return cleanButton
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(red:0.75, green:0.76, blue:0.82, alpha:1.0)
        
        view.addSubview(imageView)
        view.addSubview(downloadButton)
        view.addSubview(setButton)
        view.addSubview(cleanButton)
    }
    
    func setSelectors() {
        downloadButton.addTarget(self, action: #selector(downloadImg), for: .touchUpInside)
        setButton.addTarget(self, action: #selector(displayImg), for: .touchUpInside)
        cleanButton.addTarget(self, action: #selector(deleteImg), for: .touchUpInside)
    }
    
    @objc func downloadImg(_ sender: UIButton)  {
        presenter?.downloadImg()
    }
    
    @objc func displayImg(_ sender: UIButton)  {
        presenter?.showImage()
    }
    
    @objc func deleteImg(_ sender: UIButton)  {
        presenter?.deleteImage()
    }
}

protocol viewControllerProtocol: class {
    func showAlert(controller: UIAlertController)
    func showImage(image: UIImage)
}


extension ViewController {
    func showAlert(controller: UIAlertController) {
        self.present(controller, animated: true, completion: nil)
    }
    
    func showImage(image: UIImage) {
        imageView.image = image
    }

}
