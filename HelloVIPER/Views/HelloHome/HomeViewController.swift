//
//  HomeViewController.swift
//  HelloVIPER
//
//  Created by Alan Badillo Salas on 26/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hello Home"
    }

    @IBAction func sayHelloAction(_ sender: Any) {
    }
    
}
