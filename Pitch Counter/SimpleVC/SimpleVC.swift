//
//  SimpleVC.swift
//  Pitch Counter
//
//  Created by Mateo Avila on 4/21/20.
//  Copyright © 2020 Mateo Avila. All rights reserved.
//

import UIKit

class SimpleVC: UIViewController {

    @IBOutlet weak var usrLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    
    var usrStr: String?
    var pwdStr: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usrLabel.text = usrStr
        pwdLabel.text = pwdStr
        

        // Do any additional setup after loading the view.
    }
    func customInit(usrStr: String, pwdStr:String){
        self.usrStr = usrStr
        self.pwdStr = pwdStr
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
