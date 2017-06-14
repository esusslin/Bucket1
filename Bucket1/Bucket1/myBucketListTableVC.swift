//
//  myBucketListTableVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/13/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit

class myBucketListTableVC: UITableViewController {
    
   var myProposals: [Proposal]! = []
    

    
    let prop1 = Proposal(item: "Gas-Porpane-Grill-Stainless-Steel-Outdoor-Patio-Cooking-BBQ", price: 249.98, monthly_payments: 41.50, months: 6)
    let prop2 = Proposal(item: "Ultimate Ears BOOM 2 Meteor Wireless Mobile Bluetooth Speaker-Waterproof", price: 179.99, monthly_payments: 44.75, months: 4)
    let prop3 = Proposal(item: "Hoover® Max Extract™ 60 Pressure Pro™ Carpet Deep Cleaner", price: 159.99, monthly_payments: 19.80, months: 8)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myProposals.append(prop1)
         myProposals.append(prop2)
         myProposals.append(prop3)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadProposals()
    }
    
    func loadProposals() {
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myProposals.count
    }
    
    //MARK: UITableviewDelegate functions
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketCell", for: indexPath) as! bucketListTableCell
        
        let prop = myProposals[indexPath.row]
        
        cell.bindData(proposal: prop)
        
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let proposal = myProposals[indexPath.row]
        
        print(proposal)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "toolBeltToShow" {
//            let indexPath = sender as! NSIndexPath
//            let toolVC = segue.destinationViewController as! ToolShowTableViewController
//            
//            
//            let tool = myTools[indexPath.row]
//            
//            toolVC.tool = tool
//            
//            
//        }
//        
//    }

    






}
