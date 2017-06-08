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
    @IBOutlet weak var sendURLBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendURLBtn_pressed(_ sender: Any) {
        blastAlamo()
    }
    
    // ALAMOFIRE IS USED TO FIRE OFF THE SINGLE CALL TO GRAPHOPPER'S API
    
    func blastAlamo() {
        
    
    Alamofire.request("localhost:3000/users/proposal").responseJSON { response in
    
        debugPrint(response)
    
        print(response.request)  // original URL request
        print(response.response) // HTTP URL response
        print(response.data)     // server data
        print(response.result)   // result of response serialization
    
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
        }
    }
    }

    
    // BONER?
    var allPathElevations = [Double]()
    
    
    
    
   
}
