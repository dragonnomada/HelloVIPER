//
//  HelloHomePresenter.swift
//  HelloVIPER
//
//  Created by Alan Badillo Salas on 26/05/23.
//

import Foundation
import Combine

protocol HelloHomeViewDelegate {
    
    var homeLabelText: String { get set }
    
    func home(result: Int)
    
}

class HelloHomePresenter {
    
    var view: HelloHomeViewDelegate?
    
    var counterSubscription: AnyCancellable?
    
    var interactor: HelloHomeInteractor? {
        didSet {
            print("HomeInteractor setted")
            counterSubscription = interactor?.$count.sink(receiveValue: { count in
                if self.interactor?.counterMode == true {
                    self.view?.homeLabelText = "Counter: \(count)"
                }
            })
        }
    }
    
    var router: HomeRouter?
    
    func sayHello() {
        if interactor?.counterMode == true {
            print("Say hello is counter mode")
            interactor?.increment()
            return
        }
        
        if view?.homeLabelText == "Hey, hello 🙌" {
            view?.homeLabelText = "Again you? 😒"
            interactor?.counterMode = true
        } else {
            view?.homeLabelText = "Hey, hello 🙌"
        }
    }
    
    func showHomeDetails(message: String) {
        print("Opening details... \(message)")
        router?.openHelloDetails(message: message)
    }
    
}

extension HelloHomePresenter: HelloHomePresenterDelegate {
    
}
