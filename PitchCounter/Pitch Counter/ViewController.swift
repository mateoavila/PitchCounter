//
//  ViewController.swift
//  Pitch Counter
//
//  Created by Mateo Avila on 4/2/20.
//  Copyright © 2020 Mateo Avila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalCounter: UILabel!
    @IBOutlet weak var ballCounter: UILabel!
    @IBOutlet weak var strikeCounter: UILabel!
    @IBOutlet weak var pitchersName: UILabel!
    
    let defaults = UserDefaults.standard
    
    var allPitchers = [pitcher]()
    var finalName = ""
    var ballTotal = 0
    var ballTotal2 = 0
    var strikeTotal = 0
    var combinedTotal = 0


    var lastBall:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        checkForStack()
        checkforTotals()
        checkforBalls()
        checkforStrikes()
        pitchersName.text = finalName + "'s"
    }
    

    @IBAction func ballTapped(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        ballTotal += 1
        combinedTotal += 1
        totalCounter.text = String(combinedTotal)
        ballCounter.text = String(ballTotal)
        lastBall.append("ball")
        saveBalls()
        saveTotal ()
        saveStack()
    }
    
    @IBAction func strikeTapped(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        strikeTotal += 1
        combinedTotal += 1
        totalCounter.text = String(combinedTotal)
        strikeCounter.text = String(strikeTotal)
        lastBall.append("strike")
        saveStrikes()
        saveTotal ()
        saveStack()
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        let alert  = UIAlertController(title: "Are you sure you want to clear?", message: "This action can not be undone and will reset the pitches.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancel")
            }))
        alert.addAction(UIAlertAction(title: "Clear", style: .destructive, handler: { (action) in
            print("Clear")
            self.strikeTotal = 0
            self.combinedTotal = 0
            self.ballTotal = 0
            self.totalCounter.text = String(self.combinedTotal)
            self.strikeCounter.text = String(self.strikeTotal)
            self.ballCounter.text = String(self.ballTotal)
            self.lastBall = []
            self.saveTotal ()
            self.saveStrikes()
            self.saveBalls()
            self.saveStack()
            }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func undoTapped(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        if (combinedTotal > 0){
            combinedTotal = combinedTotal - 1
            totalCounter.text = String(combinedTotal)
            let compare = lastBall.popLast()
            if (compare == "ball"){
                ballTotal = ballTotal - 1
                ballCounter.text = String(ballTotal)
                saveBalls()
            } else if (compare == "strike"){
                strikeTotal = strikeTotal - 1
                strikeCounter.text = String(strikeTotal)
                saveStrikes()
            }
                
        }

        saveTotal ()
        saveStack()
    }
    
 
    
    
    //for saving the pitches
    func saveTotal (){
        defaults.set(combinedTotal, forKey: "totals")
    }
    
    func checkforTotals () {
        let total = defaults.value(forKey: "totals") as? Int ?? combinedTotal
        combinedTotal = total
        self.totalCounter.text = String(self.combinedTotal)
    }
    
    func saveBalls(){
        defaults.set(ballTotal, forKey: "balls")
    }
    
    func checkforBalls(){
        let balls = defaults.value(forKey: "balls") as? Int ?? ballTotal
        ballTotal = balls
        self.ballCounter.text = String(self.ballTotal)
    }
    
    func saveStrikes(){
        defaults.set(strikeTotal, forKey: "strikes")
    }
    
    func checkforStrikes(){
        let strikes = defaults.value(forKey: "strikes") as? Int ?? strikeTotal
        strikeTotal = strikes
        self.strikeCounter.text = String(self.strikeTotal)
    }
    
    func saveStack (){
        defaults.set(lastBall, forKey: "stack")
    }
    
    func checkForStack(){
        let stack = defaults.value(forKey: "stack") as? [String] ?? lastBall
        lastBall = stack
    }
}
    


