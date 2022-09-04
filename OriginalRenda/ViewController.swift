//
//  ViewController.swift
//  OriginalRenda
//
//  Created by 日暮駿之介 on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nabeatsuPhoto:UIImageView!
    
    //タップ数を表示するLabelの変数を準備する
    @IBOutlet var scoreLabel:UILabel!
    @IBOutlet var tapLabel:UILabel!
    
    //TAPボタンの変数を準備する
    @IBOutlet var tapButton:UIButton!
    
    @IBOutlet var gachaLabel:UILabel!
    @IBOutlet var gachaImage:UIImageView!
    @IBOutlet var gachaButton:UIButton!
    
    @IBOutlet var GachaNabeImage:UIImageView!
    
    @IBOutlet var Lastlabel:UILabel!
    @IBOutlet var Lastnabeatsu:UIImageView!
    
    //タップ数を数える変数を準備する
    var tapCount=0
    var scoreCount=0
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tapButton.layer.cornerRadius=50
    }
    
    //TAPボタンが追加されたときに
    @IBAction func tapTapButton(){
        
        GachaNabeImage.isHidden=true
        
        //タップを数える変数をプラス１する
        tapCount=tapCount+1
        
        //タップされた和をラベルに反映する
        scoreLabel.text=String(scoreCount)
        tapLabel.text=String(tapCount)
        
        
        if ((tapCount%15==0)||(tapCount==35)||(tapCount==51)||(tapCount==54)||(tapCount==57)){
            
            gachaImage.image=UIImage(named: "gacha")
            gachaButton.setTitle("PUSH!", for: .normal)
            gachaLabel.text="GACHANCE!!"
            gachaImage.isHidden=false
            gachaButton.isHidden=false
            gachaLabel.isHidden=false
            
        }
        else{
            gachaImage.isHidden=true
            gachaButton.isHidden=true
            gachaLabel.isHidden=true
            
            if(tapCount%3==0)||(tapCount>=30&&tapCount<=39)||((tapCount%10==3)&&tapCount>=13){
                scoreCount+=3
                nabeatsuPhoto.image=UIImage(named: "nabeatsuAho")!
                nabeatsuPhoto.center=CGPoint(x:Double.random(in: 70...350), y:Double.random(in: 150...550) )
            }
            else if(tapCount%5==0)||(tapCount>=50&&tapCount<=59){
                scoreCount+=5
                nabeatsuPhoto.image=UIImage(named: "nabeatsuInu")!
                nabeatsuPhoto.center=CGPoint(x:Double.random(in: 70...350), y:Double.random(in: 150...550) )
            }
            else{
                scoreCount+=1
                nabeatsuPhoto.image=UIImage(named: "nabeatsuHutsuu")!
                nabeatsuPhoto.center=CGPoint(x:Double.random(in: 70...350), y:Double.random(in: 150...450) )
                
            }
        }
        
    }
    
    @IBAction func tapGachaButton(){
        GachaNabeImage.isHidden=false
        var a:Int!
        a=Int.random(in: 0...2)
        let nabeArray: [String] = ["nabeatsuAho","nabeatsuHutsuu","nabeatsuInu"]
        GachaNabeImage.image=UIImage(named:nabeArray[a])
        switch a {
            case 0 :scoreCount*=3
            case 1 :scoreCount*=1
            case 2 :scoreCount*=5
            default: break
        }
    }
    
    @IBOutlet var timerLabel:UILabel!
    @IBOutlet var timerButton:UIButton!
    
    var count=10.0
    var timer:Timer=Timer()
    
    @IBAction func tapTimer(){
        timer=Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
//        if count==0.0{
//            timer.invalidate()
//            Lastlabel.text=String(format: "score:%d",scoreCount)
//            Lastnabeatsu.image=UIImage(named: "nabeatsuLast")
//        }
    }
    func Last(){
        if count==0.0{
            timer.invalidate()
            Lastlabel.text=String(format: "score:%d",scoreCount)
            Lastnabeatsu.image=UIImage(named: "nabeatsuLast")
        }
    }
    
    @objc func up(){
        count-=0.01
        timerLabel.text=String(format: "%.2f",count)
    }
    
}

