//
//  proposalVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/14/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit
import SwiftRangeSlider

class proposalVC: UIViewController {
    
    var theItem: String = ""
    var thePrice: Double = 0.0
    var theMonthly_payments: Double = 0.0
    var theMonths: Int = 0
    
    var theProposal: Proposal?
    
    var proposal = Proposal()
    
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var monthly: UILabel!
    @IBOutlet weak var months: UILabel!
    
    @IBOutlet weak var approveBucketBtn: UIButton!

    @IBOutlet weak var paymentSlider: UISlider!
    @IBOutlet weak var monthSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       proposal = theProposal!
        
        print("proposalVC!")
        print(proposal)
        print(theProposal)
        item.text = proposal.item
        price.text = String(proposal.price)
        
        monthly.text = String(proposal.monthly_payments)
        months.text = String(proposal.months)

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
        
                proposal.monthly_payments = (proposal.price / Double(currentValue))
                monthly.text = String(proposal.monthly_payments)
        
        
            if (currentValue < 0.11) {
                    proposal.months = 12
                } else if (currentValue < 0.12) {
                      proposal.months = 10
                    } else if (currentValue < 0.14) {
                    proposal.months = 9
               } else if (currentValue < 0.15) {
                    proposal.months = 8
            } else if (currentValue < 0.16) {
                proposal.months = 7
            } else if (currentValue < 0.18) {
                proposal.months = 6
            } else if (currentValue < 0.18) {
                    proposal.months = 5
                 } else if (currentValue < 0.25) {
                     proposal.months = 5
                } else if (currentValue < 0.25) {
                proposal.months = 5
                } else if (currentValue < 0.30) {
                proposal.months = 4
            } else if (currentValue < 0.333) {
                proposal.months = 3
        
            } else  {
                proposal.months = 3
                }
        
                months.text = String(proposal.months)
    }
        
    
        

  
    @IBAction func monthlySlider_changed(_ sender: UISlider) {
        
                var currentValue = sender.value
        
                proposal.monthly_payments = Double(currentValue)
        
                months.text = String(proposal.monthly_payments)
        
                proposal.monthly_payments = (proposal.price / Double(currentValue))
        
                monthly.text = String(proposal.monthly_payments)
    }


        
//        var currentValue = Int(sender.value)
        
//        proposal.monthly_payments = currentValue
//        
//        months.text = String(proposal.monthly_payments)
//        
//        proposal.monthly_payments = (proposal.price / currentValue)
//        
//        monthly.text = String(proposal.monthly_payments)


}
