//
//  mainNavCon.swift
//  Pitch Counter
//
//  Created by Mateo Avila on 4/20/20.
//  Copyright © 2020 Mateo Avila. All rights reserved.
//

import Foundation
import UIKit

class mainNavCon: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addPitcher(_ sender: Any) {
           let alertController = UIAlertController(title: "Add Pitcher", message: nil, preferredStyle: .alert)
           
           alertController.addTextField(configurationHandler: )
           
       }
}

