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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var urlTextField: UITextField!
   

    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        urlTextField.text = ""
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func sendURLBtn_pressed(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        print(self.urlTextField.text!)
        
        postSemantics(url: self.urlTextField.text!)


        print(user_id)

    }
    
    
    func postSemantics(url: String) {
        
        let parameters: Parameters = ["url": url, "user_id": user_id]
        
        Alamofire.request("http://localhost:3000/proposals/url", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
        }        // code
    }

    
    


    
    

   
}



extension urlVC {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(urlVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
