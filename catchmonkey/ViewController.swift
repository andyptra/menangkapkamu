//
//  ViewController.swift
//  catchmonkey
//
//  Created by andyptra on 8/22/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()

    }

    
    
    @IBAction func startbutton(_ sender: Any) {
        performSegue(withIdentifier: "tomainVC", sender: nil)
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

