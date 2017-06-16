//
//  proposalVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/14/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit
import SwiftRangeSlider
import Alamofire

class proposalVC: UIViewController {
    
   var proposal1: Proposal?
   
    var proposal = Proposal(item: "", price: 100.0, imageString: "")
    

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var monthly: UILabel!
    @IBOutlet weak var months: UILabel!
    
    @IBOutlet weak var approveBucketBtn: UIButton!

    @IBOutlet weak var paymentSlider: UISlider!
    @IBOutlet weak var monthSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proposal = proposal1!
        
        print(proposal)
        item.text = proposal.item
        price.text = String(proposal.price)
        months.text = String(proposal.months)
        monthly.text = String(proposal.monthly)
        
        paymentSlider.setValue((Float(proposal.monthly / proposal.price)), animated: true)
        monthSlider.setValue((Float(proposal.price / proposal.monthly)), animated: true)
        
        let url = URL(string: proposal.imageString)!
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: data!)
            
            imageView.image = image
//            imageView.layer.cornerRadius = 8
            imageView.layer.shadowOpacity = 0.8
        }
        
        self.imageView.layer.cornerRadius = self.imageView.frame.width/4.0
        self.imageView.layer.shadowOpacity = 0.8
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func BackBtn_pressed(_ sender: Any) {
        
        dismiss(animated: true)
    }
    

    
    
    @IBAction func paymentSlider_changed(_ sender: UISlider) {
        
        var currentValue = sender.value
        
        print(currentValue)
        
//        Double(round(100*x)/100)
                let x = (proposal.price * Double(currentValue))
                proposal.monthly = Double(round(100*x)/100)
                monthly.text = String(proposal.monthly)
        
//
            if (currentValue < 0.11) {
                    proposal.months = 12
                } else if (currentValue < 0.12) {
                      proposal.months = 10
                monthSlider.setValue(10.0, animated: true)
                    } else if (currentValue < 0.14) {
                monthSlider.setValue(9.0, animated: true)
                    proposal.months = 9
               } else if (currentValue < 0.15) {
                    proposal.months = 8
                monthSlider.setValue(8.0, animated: true)
            } else if (currentValue < 0.16) {
                proposal.months = 7
                monthSlider.setValue(7.0, animated: true)
            } else if (currentValue < 0.18) {
                monthSlider.setValue(6.0, animated: true)
                proposal.months = 6
            } else if (currentValue < 0.18) {
                monthSlider.setValue(5.0, animated: true)
                    proposal.months = 5
                 } else if (currentValue < 0.25) {
                monthSlider.setValue(4.0, animated: true)
                     proposal.months = 4
                } else if (currentValue < 0.25) {
                monthSlider.setValue(3.0, animated: true)
                proposal.months = 3
                } else if (currentValue < 0.30) {
                monthSlider.setValue(3.4, animated: true)
                proposal.months = 3
            } else if (currentValue < 0.333) {
                monthSlider.setValue(3.0, animated: true)
                proposal.months = 3
        
            } else  {
                monthSlider.setValue(3.0, animated: true)
                proposal.months = 3
                }
        
                months.text = String(proposal.months)
    }
        
    
    @IBAction func approveBucket(_ sender: Any) {
        
        
        print(proposal.imageString)
        print(proposal.price)

            let parameters: Parameters = ["bucket": ["item": proposal.item, "price": proposal.price, "monthly": proposal.monthly, "months": proposal.months, "imageString": proposal.imageString]
        ]
            
            Alamofire.request("http://localhost:3000/users/lol", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300)
                .responseJSON() { response in
                    print(response)
                    
                    if let JSON = response.result.value as? [String:Any] {
                       print(JSON)
                        
                        let bucket = Bucket(item: JSON["item"] as! String, price: JSON["price"] as! Double, imageString: JSON["imageString"] as! String, months: JSON["months"] as! Int, monthly: JSON["monthly"] as! Double)
                        
                       
                        

                        
                        let alert = UIAlertController(title: "New Bucket:  \(bucket.item) ..!", message: "This bucket fills in \(bucket.months)", preferredStyle: .alert)
                        
                        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                            

                        }
                        alert.addAction(cancelAction)
                        
                        
                        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.30)
                        alert.view.addConstraint(height);
                        self.present(alert, animated: true, completion: nil)
                        

                        
                    }

            }        // code
        

        
    }
    

  
    @IBAction func monthlySlider_changed(_ sender: UISlider) {
        
                var currentValue = sender.value
        
                proposal.months = Int(currentValue)
        
                let x = (proposal.price / Double(currentValue))
        
                proposal.monthly = Double(round(100*x)/100)
        
                months.text = String(proposal.months)
        
                monthly.text = String(proposal.monthly)
        print(currentValue)
        
                   }
//
//
//        
//        var currentValue = Int(sender.value)
//        
//        proposal.monthly_payments = currentValue
//        
//        months.text = String(proposal.monthly_payments)
//        
//        proposal.monthly_payments = (proposal.price / currentValue)
//        
//        monthly.text = String(proposal.monthly_payments)


}
