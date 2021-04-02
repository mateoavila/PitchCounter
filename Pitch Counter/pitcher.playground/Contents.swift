import UIKit

struct pitcher {
    var name:String
    var strikes:Int = 0
    var balls:Int = 0
    var total:Int = 0

    mutating func addBall(){
        balls = balls + 1
        total = total + 1
//        print ("balls:\(balls) Strikes:\(strikes) Total:\(total) " )
    }
    mutating func addStrike(){
        strikes = strikes + 1
        total = total + 1
//         print ("balls:\(balls) Strikes:\(strikes) Total:\(total) " )
    }
}

var allPitchers = [pitcher]()


var tempPitcher = pitcher(name: "mateo")
tempPitcher.addBall()
tempPitcher.addBall()
tempPitcher.addStrike()
tempPitcher.addStrike()
allPitchers.append(tempPitcher)



tempPitcher = pitcher(name: "taylor")
tempPitcher.addStrike()
tempPitcher.addStrike()
allPitchers.append(tempPitcher)



tempPitcher = pitcher(name: "cathy")
tempPitcher.addBall()
tempPitcher.addBall()
allPitchers.append(tempPitcher)


var whichPitcher = 0

allPitchers[whichPitcher].addBall()

allPitchers[whichPitcher].addStrike()

allPitchers[whichPitcher].addBall()

print(allPitchers)


allPitchers.remove(at: 1)

whichPitcher = 1
allPitchers[whichPitcher].addStrike()
print(allPitchers)

