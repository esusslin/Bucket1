//
//  urlVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/7/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit
import Alamofire

class urlVC: UIViewController {
    
    
    @IBOutlet weak var urlTextField: UITextField!

    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendURLBtn_pressed(_ sender: Any) {
        
        print("SEARCH KICKED OFF")
//        Search.postProposals()
        
        Search.posturl(url: urlTextField.text!)
//        blastAlamo()
    }
    
    
    
   
}
