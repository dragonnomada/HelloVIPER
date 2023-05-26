//
//  HelloHomeInteractor.swift
//  HelloVIPER
//
//  Created by Alan Badillo Salas on 26/05/23.
//

import Foundation
import Combine

protocol HelloHomePresenterDelegate {
    
    func sayHello()
    
}

class HelloHomeInteractor {
    
    var presenter: HelloHomePresenterDelegate?
    
    @Published var count = 0 {
        didSet {
            print("Counter: \(count)")
        }
    }
    @Published var counterMode = false {
        didSet {
            if !counterMode {
                presenter?.sayHello()
                count = 0
            }
            print("Counter mode: \(counterMode)")
        }
    }
    
    func increment() {
        count += 1
        
        if count > 10 {
            counterMode = false
        }
    }
    
}
