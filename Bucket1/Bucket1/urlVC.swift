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
        
//        let proposal = Proposal?
        
        let parameters: Parameters = ["url": url, "user_id": user_id]
        
        Alamofire.request("http://localhost:3000/proposals/url", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
//                print(response)
                
                 if let JSON = response.result.value as? [String:Any] {
                    print(JSON)
                    
                let proposal = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
                    
                    myProposals.append(proposal)
                    
//                    trunc(length: Int, trailing: String? = "...")
                    
//                      let truncateItemSTring = proposal.item.trunc(length: 10, )
                    
                    //                let alertController = UIAlertController(title: nil, message: "New Bucket Offer:", preferredStyle: .alert)
                    let alert = UIAlertController(title: "New Proposal: \(proposal.item) ..!", message: "Pay for this item in 8 months at \(proposal.monthly)", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // hide action sheet
                    }
                    alert.addAction(cancelAction)
                    
                    
                    let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.80)
                    alert.view.addConstraint(height);
                    self.present(alert, animated: true, completion: nil)
                
//                    let proposal.imageString = JSON["imageString"] as! String
                    
                }
                
              
                

                
//                let alert = UIAlertController(title: "New Proposal", message: "Ultimate Ears BOOM 2 for $129.99", preferredStyle: .actionSheet)
//                alert.addAction(UIAlertAction(title: "See Bucket List", style: .default) { action in
//                    // perhaps use action.title here
//                })
//                self.present(alert, animated: true)
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
