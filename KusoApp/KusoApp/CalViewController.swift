//
//  CalViewController.swift
//  KusoApp
//
//  Created by ANNotunzdY on 2017/03/04.
//  Copyright © 2017 Kibousoft LLC. All rights reserved.
//

import UIKit

class CalViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var tmpNum = 0
    var resultMode = false
    
    @IBOutlet weak var button1: KusoButton!
    @IBOutlet weak var button2: KusoButton!
    @IBOutlet weak var button3: KusoButton!
    @IBOutlet weak var button4: KusoButton!
    @IBOutlet weak var button5: KusoButton!
    @IBOutlet weak var buttpn6: KusoButton!
    @IBOutlet weak var button7: KusoButton!
    @IBOutlet weak var button8: KusoButton!
    @IBOutlet weak var button9: KusoButton!
    @IBOutlet weak var button10: KusoButton!
    
    @IBAction func kusoButtonAction(_ sender: KusoButton) {
        if textField.text! == "0" || resultMode {
            textField.text = ""
        }
        textField.text = textField.text! + String(sender.number)
        mapping()
        resultMode = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mapping()
    }
    
    func mapping() {
        button1.number = Int(arc4random()) % 10
        button2.number = Int(arc4random()) % 10
        button3.number = Int(arc4random()) % 10
        button4.number = Int(arc4random()) % 10
        button5.number = Int(arc4random()) % 10
        buttpn6.number = Int(arc4random()) % 10
        button7.number = Int(arc4random()) % 10
        button8.number = Int(arc4random()) % 10
        button9.number = Int(arc4random()) % 10
        button10.number = Int(arc4random()) % 10
    }
    
    @IBAction func plusAction(_ sender: Any) {
        tmpNum = Int(textField.text!)!
        textField.text = "0"
        resultMode = false
        mapping()
    }
    @IBAction func resultAction(_ sender: Any) {
        if (Int(arc4random()) % 5 == 0) {
            let alert = UIAlertController(title: "計算したくない", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "また今度", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        let result = tmpNum + Int(textField.text!)!
        textField.text = String(result)
        tmpNum = result
        resultMode = true
        mapping()
    }
}
