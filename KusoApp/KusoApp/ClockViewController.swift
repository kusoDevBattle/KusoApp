//
//  ClockViewController.swift
//  KusoApp
//
//  Created by ANNotunzdY on 2017/03/04.
//  Copyright © 2017 Kibousoft LLC. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    var timer: Timer?
    var animation: CABasicAnimation?
    
    @IBOutlet weak var h1Label: UILabel!
    @IBOutlet weak var h2Label: UILabel!
    @IBOutlet weak var h3Label: UILabel!
    @IBOutlet weak var h4Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateLabelText()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [unowned self] (timer) in
            self.updateLabelText()
            if self.animation != nil { // クソモード時
                self.changeBG()
            }
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
    }
    
    @IBAction func rotateAction(_ sender: Any) {
        guard animation == nil else {
            return
        }
         animation = CABasicAnimation(keyPath: "transform.rotation")
        if let animation = animation {
            animation.fromValue = 0
            animation.toValue = M_PI * 2
            animation.duration = 1.0
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.isRemovedOnCompletion = false
            animation.repeatCount = Float(CGFloat.infinity)
            animation.fillMode = kCAFillModeForwards;
            animation.autoreverses = false
            stackView.layer.add(animation, forKey: "rotate")
        }
    }

    func updateLabelText() {
        let n0 = "⌚️⌚️⌚️\n⌚️💩⌚️\n⌚️💩⌚️\n⌚️💩⌚️\n⌚️⌚️⌚️"
        let n1 = "💩⌚️💩\n💩⌚️💩\n💩⌚️💩\n💩⌚️💩\n💩⌚️💩"
        let n2 = "⌚️⌚️⌚️\n💩💩⌚️\n⌚️⌚️⌚️\n⌚️💩💩\n⌚️⌚️⌚️"
        let n3 = "⌚️⌚️⌚️\n💩💩⌚️\n⌚️⌚️⌚️\n💩💩⌚️\n⌚️⌚️⌚️"
        let n4 = "⌚️💩⌚️\n⌚️💩⌚️\n⌚️⌚️⌚️\n💩💩⌚️\n💩💩⌚️"
        let n5 = "⌚️⌚️⌚️\n⌚️💩💩\n⌚️⌚️⌚️\n💩💩⌚️\n⌚️⌚️⌚️"
        let n6 = "⌚️⌚️⌚️\n⌚️💩💩\n⌚️⌚️⌚️\n⌚️💩⌚️\n⌚️⌚️⌚️"
        let n7 = "⌚️⌚️⌚️\n💩💩⌚️\n💩💩⌚️\n💩💩⌚️\n💩💩⌚️"
        let n8 = "⌚️⌚️⌚️\n⌚️💩⌚️\n⌚️⌚️⌚️\n⌚️💩⌚️\n⌚️⌚️⌚️"
        let n9 = "⌚️⌚️⌚️\n⌚️💩⌚️\n⌚️⌚️⌚️\n💩💩⌚️\n⌚️⌚️⌚️"
        
        let date = Date()
        let calender = NSCalendar(calendarIdentifier: .gregorian)
        let components = calender?.components([.hour, .minute], from: date)
        let hour = components!.hour! % 12
        let min = components!.minute!
    
        if hour > 9 {
            h1Label.text = n1
            if hour == 10 {
                h2Label.text = n0
            }
            if hour == 11 {
                h2Label.text = n0
            }
            if hour == 12 {
                h2Label.text = n0
            }
        } else {
            if hour == 1 {
                h2Label.text = n1
            }
            if hour == 2 {
                h2Label.text = n2
            }
            if hour == 3 {
                h2Label.text = n3
            }
            if hour == 4 {
                h2Label.text = n4
            }
            if hour == 5 {
                h2Label.text = n5
            }
            if hour == 6 {
                h2Label.text = n6
            }
            if hour == 7 {
                h2Label.text = n7
            }
            if hour == 8 {
                h2Label.text = n8
            }
            if hour == 9 {
                h2Label.text = n9
            }
        }
        
        if min >= 50 {
            h3Label.text = n5
        } else if min >= 40 {
            h3Label.text = n4
        } else if min >= 30 {
            h3Label.text = n3
        } else if min >= 20 {
            h3Label.text = n2
        } else if min >= 10 {
            h3Label.text = n1
        } else {
            h3Label.text = n0
        }
        
        let smin = min % 10
        
        if smin == 1 {
            h4Label.text = n1
        }
        if smin == 2 {
            h4Label.text = n2
        }
        if smin == 3 {
            h4Label.text = n3
        }
        if smin == 4 {
            h4Label.text = n4
        }
        if smin == 5 {
            h4Label.text = n5
        }
        if smin == 6 {
            h4Label.text = n6
        }
        if smin == 7 {
            h4Label.text = n7
        }
        if smin == 8 {
            h4Label.text = n8
        }
        if smin == 9 {
            h4Label.text = n9
        }
        
        
    }
    
    func changeBG() {
        let hue = ( CGFloat(Int(arc4random()) % 256) / 256.0 )  //  0.0 to 1.0
        let saturation = ( CGFloat(Int(arc4random()) % 128) / 256.0 ) + 0.5  //  0.5 to 1.0, away from white
        let brightness = ( CGFloat(Int(arc4random()) % 128) / 256.0 ) + 0.5  //  0.5 to 1.0, away from black
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        view.backgroundColor = color
    }
    
}
