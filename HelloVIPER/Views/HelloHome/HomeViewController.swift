//
//  HomeViewController.swift
//  HelloVIPER
//
//  Created by Alan Badillo Salas on 26/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HelloHomePresenter?
    
    @IBOutlet weak var homeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hello Home"
        
        let detailsButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(showDetails))
        
        navigationItem.rightBarButtonItem = detailsButton
    }
    
    @objc func showDetails(sender: Any) {
        print("Showing details...")
        presenter?.showHomeDetails(message: "Hi there")
    }

    @IBAction func sayHelloAction(_ sender: Any) {
        presenter?.sayHello()
    }
    
}

extension HomeViewController: HelloHomeViewDelegate {
    var homeLabelText: String {
        get {
            homeLabel.text ?? ""
        }
        set {
            homeLabel.text = newValue
        }
    }
    
    func home(result: Int) {
        homeLabelText = "Result: \(result) 🎲"
    }
    
    
}
