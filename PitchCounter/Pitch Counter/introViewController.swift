//
//  introViewController.swift
//  Pitch Counter
//
//  Created by Mateo Avila on 4/23/20.
//  Copyright © 2020 Mateo Avila. All rights reserved.
//

import UIKit


struct pitcher {
    var name:String
    var strikes:Int = 0
    var balls:Int = 0
    var total:Int = 0
    
    mutating func addBall(){
        balls = balls + 1
        total = total + 1
        print ("balls:\(balls) Strikes:\(strikes) Total:\(total) " )
    }
    mutating func addStrike(){
        strikes = strikes + 1
        total = total + 1
         print ("balls:\(balls) Strikes:\(strikes) Total:\(total) " )
    }
}

class introViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var PitchersName: UITextField!
    @IBOutlet weak var listTotal: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var nameText = ""
    var pitchTotal = 0
    var allPitchers = [pitcher]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.PitchersName.delegate = self
        listTotal.text = String(pitchTotal)
        checkforSavedName()
        checkforSavedPitches()
    }
    //loading table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPitchers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allPitchers[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    //
    
    @IBAction func PitchersInList(_ sender: Any) {
        let name = PitchersName.text
        _ = name!
        self.saveName()
      }
    
    
    // this will create a new instance of the pitvch counter and a new line
    @IBAction func plusTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Enter pitchers name", message: nil, preferredStyle: .alert)
        
        alert.addTextField()

        alert.textFields![0].placeholder = "Kershaw"
        alert.textFields![0].keyboardType = UIKeyboardType.asciiCapable
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action) in
            print("canceled...")
        }))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {(action) in
            let pitcherNameText = alert.textFields![0].text
         
            self.PitchersName.text = pitcherNameText
            let tempPitcher = pitcher(name: pitcherNameText!)
            self.allPitchers.append(tempPitcher)
            self.saveName()
            print (self.allPitchers)
        }))
        
        self.present(alert, animated: true)
        let nextPitcher: pitcher = pitcher(name: PitchersName.text!)
        allPitchers.append(nextPitcher)
        
    }

    
    
   // saving user data
    func saveName (){
        defaults.set(PitchersName.text!, forKey: "pitchersName")
    }
    func checkforSavedName () {
        let name = defaults.value(forKey: "pitchersName") as? String ?? "Pitcher 1"
        PitchersName.text = name
    }
    
    func savePitchList (){
        defaults.set(listTotal.text!, forKey: "listTotal")
    }

    func checkforSavedPitches () {
        let pitches = defaults.value(forKey: "listTotal") as? Int ?? 1
        listTotal.text = String(pitches)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.finalName = self.nameText
        self.pitchTotal = vc.combinedTotal
        listTotal.text = String(pitchTotal)
        savePitchList ()
    }
    
    
    
    // removing the keyboard
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           PitchersName.resignFirstResponder()
           return true
           
       }
}


