//
//  LobbyViewController.swift
//  OriginalRenda
//
//  Created by 日暮駿之介 on 2022/09/04.
//

import UIKit

class LobbyViewController: UIViewController {
    
    @IBOutlet var start1Button:UIButton!
    @IBOutlet var ruleButton:UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        start1Button.layer.cornerRadius=75
        ruleButton.layer.cornerRadius=75

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var timerLabel:UILabel!
    @IBOutlet var timerButton:UIButton!
    
    var count=0.0
    var timer:Timer=Timer()
    
    @IBAction func tapTimer(){
        timer=Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
    }
    
    @objc func up(){
        count+=0.01
        timerLabel.text=String(format: "%.2f",count)
    }


}
