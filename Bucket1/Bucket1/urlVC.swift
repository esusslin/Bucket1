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
//                    print(JSON)
                    
                let proposal1 = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
                    let proposal2 = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
                    let proposal3 = Proposal(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String)
                    
                    print(proposal1)
                    myProposals.append(proposal1)
                    myProposals.append(proposal2)
                    myProposals.append(proposal3)
//                    ["months": <null>, "imageString": http://sem3-idn.s3-website-us-east-1.amazonaws.com/128e67a106566ea787c0b8bdd99b6f72,0.jpg, "updated_at": <null>, "id": <null>, "item": 5-Burner Gas Grill, Stainless Steel/Black, "created_at": <null>, "monthly": <null>, "user_id": <null>, "price": 156.07]
//                        [Bucket1.Proposal]
//                    
//                    trunc(length: Int, trailing: String? = "...")
                    
//                      let truncateItemSTring = proposal.item.trunc(length: 10, )
                    
                    //                let alertController = UIAlertController(title: nil, message: "New Bucket Offer:", preferredStyle: .alert)
                    let alert = UIAlertController(title: "New Proposal: \(proposal2.item) ..!", message: "Pay for this item in 8 months at \(proposal2.monthly)", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        
                        print("BONER!")
                        print(myProposals[1].item)
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
