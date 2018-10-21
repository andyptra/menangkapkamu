//
//  mainVC.swift
//  catchmonkey
//
//  Created by andyptra on 8/22/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class mainVC: UIViewController {

    @IBOutlet weak var monkey1: UIImageView!
    
    @IBOutlet weak var monkey2: UIImageView!
    
    @IBOutlet weak var monkey3: UIImageView!
    
    @IBOutlet weak var monkey4: UIImageView!
    
    @IBOutlet weak var monkey5: UIImageView!
    
    @IBOutlet weak var monkye6: UIImageView!
    
    @IBOutlet weak var monkey7: UIImageView!
    
    @IBOutlet weak var monkey8: UIImageView!
    
    @IBOutlet weak var monkey9: UIImageView!
    
    @IBOutlet weak var monkey10: UIImageView!
    
    @IBOutlet weak var monkey11: UIImageView!
    
    @IBOutlet weak var monkey12: UIImageView!
    
    @IBOutlet weak var timelabel: UILabel!
    
    @IBOutlet weak var scorelabel: UILabel!
    
    @IBOutlet weak var highscorelabel: UILabel!
    
    var score = 0
    var counter = 0
    var timer = Timer()
    
    var hidetimer = Timer()
    
    var monkeyarray = [UIImageView] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bg2()
        
        let highscore = UserDefaults.standard.object(forKey: "Highscore") 
        if highscore == nil {
            highscorelabel.text = "0"
        }
        
        if let newhighscore = highscore as? Int {
            highscorelabel.text = String(newhighscore)
        }
        
        
        scorelabel.text = "Skor : \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
         let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(mainVC.tambahscore))
        
        
         monkey1.addGestureRecognizer(recognizer1)
          monkey2.addGestureRecognizer(recognizer2)
          monkey3.addGestureRecognizer(recognizer3)
          monkey4.addGestureRecognizer(recognizer4)
          monkey5.addGestureRecognizer(recognizer5)
          monkye6.addGestureRecognizer(recognizer6)
          monkey7.addGestureRecognizer(recognizer7)
          monkey8.addGestureRecognizer(recognizer8)
          monkey9.addGestureRecognizer(recognizer9)
          monkey10.addGestureRecognizer(recognizer10)
          monkey11.addGestureRecognizer(recognizer11)
          monkey12.addGestureRecognizer(recognizer12)
        
        
        monkey1.isUserInteractionEnabled = true
        monkey2.isUserInteractionEnabled = true
        monkey3.isUserInteractionEnabled = true
        monkey4.isUserInteractionEnabled = true
        monkey5.isUserInteractionEnabled = true
        monkye6.isUserInteractionEnabled = true
        monkey7.isUserInteractionEnabled = true
        monkey8.isUserInteractionEnabled = true
        monkey9.isUserInteractionEnabled = true
        monkey10.isUserInteractionEnabled = true
        monkey11.isUserInteractionEnabled = true
        monkey12.isUserInteractionEnabled = true
        
        // membuat timer
        counter = 30
        timelabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mainVC.countdown), userInfo: nil, repeats: true)
        
        hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(mainVC.hidemonkey), userInfo: nil, repeats: true)
        
        monkeyarray.append(monkey1)
        monkeyarray.append(monkey2)
        monkeyarray.append(monkey3)
        monkeyarray.append(monkey4)
        monkeyarray.append(monkey5)
        monkeyarray.append(monkye6)
        monkeyarray.append(monkey7)
        monkeyarray.append(monkey8)
        monkeyarray.append(monkey9)
        monkeyarray.append(monkey10)
        monkeyarray.append(monkey11)
        monkeyarray.append(monkey12)
        hidemonkey()
        
    }
    func tambahscore() {
        score+=1
        scorelabel.text = "Skor : \(score)"
    }
    
    
    func countdown () {
        
        counter = counter - 1
        timelabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hidetimer.invalidate()
            
            // melihat skor tertinggi
            if self.score > Int(highscorelabel.text!)!{
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highscorelabel.text = String(self.score)
            }
            
            
            // membuat allert
            let alert = UIAlertController(title: "waktu habis", message: "waktu anda habis", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(ok)
            
            let replay = UIAlertAction(title: "Ulangi Lagi", style: UIAlertActionStyle.default, handler: {(UIAlertAction) in
                
                self.score = 0
                self.scorelabel.text = " Skor : \(self.score)"
                self.counter = 30
                self.timelabel.text = "\(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mainVC.countdown), userInfo: nil, repeats: true)
                self.hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(mainVC.hidemonkey), userInfo: nil, repeats: true)
                
            })
            
            
            let nextlevel = UIAlertAction(title: "level 2", style: UIAlertActionStyle.default, handler:{(UIAlertAction) in
            
                self.score = 0
                self.scorelabel.text = " Skor : \(self.score)"
                self.counter = 30
                self.timelabel.text = "\(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mainVC.countdown), userInfo: nil, repeats: true)
                self.hidetimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mainVC.hidemonkey), userInfo: nil, repeats: true)
                
                
            } )
            
            
            alert.addAction(nextlevel)
            alert.addAction(replay)
            
            
            self.present(alert,animated: true,completion: nil)
            
            
            
        }
    }
    
    func hidemonkey(){
        
        for monkey in monkeyarray {
            monkey.isHidden = true
        }
        let randomnumber = Int(arc4random_uniform(UInt32(11)))
        
        monkeyarray[randomnumber].isHidden = false
        
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //It will show the status bar again after dismiss
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
