//
//  HelloRouter.swift
//  HelloVIPER
//
//  Created by Alan Badillo Salas on 26/05/23.
//

import Foundation
import UIKit

class HomeRouter {
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        
        //TODO: Configure navigationController
        
        return navigationController
    }()
    
    func initialize() {
        openHelloHome()
    }
    
    func openHelloHome() {
        print("Open HelloHome")
        
        let interactor = HelloHomeInteractor()
        let presenter = HelloHomePresenter()
        let view = HomeViewController()
        
        interactor.presenter = presenter
        
        presenter.router = self
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func openHelloDetails(message: String) {
        print("OpenHelloDetails")
        
        let view = HelloDetailViewController()
        
        navigationController.pushViewController(view, animated: true)
    }
    
}
