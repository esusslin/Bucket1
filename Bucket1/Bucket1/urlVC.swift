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
    
//    let parameters: Parameters = ["bucket": ["item": "boner", "price": "boner", "monthly": "boner", "months": "boner"]
//    ]
//    
//    Alamofire.request("https://localhost:3000/proposals/hello", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//    .validate(statusCode: 200..<300)
//    .responseJSON() { response in
//    print(response)
//    }
    
    
    func postSemantics(url: String) {

        
        let parameters: Parameters = ["url": url, "user_id": user_id]
        
        Alamofire.request("http://localhost:3000/proposals/url", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
//                print(response)
                
                 if let JSON = response.result.value as? [String:Any] {
                    print(JSON)
                    
                    let proposal1 = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
//                    let proposal2 = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
//                    let proposal3 = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
                    
                    print(proposal1)
                    myProposals.append(proposal1)
                


                    let alert = UIAlertController(title: "New Proposal: \(proposal1.item) ..!", message: "Pay for this item in 8 months at \(proposal1.monthly)", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        
                        print("BONER!")
                       
                    }
                    alert.addAction(cancelAction)
                    
                    
                    let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.80)
                    alert.view.addConstraint(height);
                    self.present(alert, animated: true, completion: nil)
                
//                    let proposal.imageString = JSON["imageString"] as! String
                    
                }
                
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
