//
//  bucketListTableVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/14/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit
import Alamofire


class bucketListTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
//    let prop1 = Proposal(item: "Gas-Porpane-Grill-Stainless-Steel-Outdoor-Patio-Cooking-BBQ", price: 249.98, monthly_payments: 41.50, months: 6)
//    let prop2 = Proposal(item: "Ultimate Ears BOOM 2 Meteor Wireless Mobile Bluetooth Speaker-Waterproof", price: 179.99, monthly_payments: 44.75, months: 4)
//    let prop3 = Proposal(item: "Hoover® Max Extract™ 60 Pressure Pro™ Carpet Deep Cleaner", price: 159.99, monthly_payments: 19.80, months: 8)
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        print("fuck off")

        
        tableView.dataSource = self
        tableView.delegate = self

        loadProposals()
//        fuckingChrist()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadProposals()
        fuckingChrist()
        
        
        
            //        var proposals: [Proposal] = []
        
      
            Alamofire.request("http://localhost:3000/users/1/buckets", method: .get, headers: nil)
                .validate(statusCode: 200..<300)
                .responseJSON { response in
                    //                    print(response.result.value)
                    myProposals.removeAll()
                    
                    if let JSON = response.result.value! as? [[String:Any]] {
                        
                        //                        print("COUNT")
                        //                        print(JSON.count)
                        
                        print(JSON)
                        
                        
                        for a in JSON {
                            
                            print("A")
                            
                                                       
                            
                            let buck = Bucket(item: a["item"] as! String, price: a["price"] as! Double, imageString: a["imageString"] as! String, months: a["months"] as! Int, monthly: a["monthly"] as! Double)
                            
                            
                            
                            myBuckets.append(buck)
                        }
                        print("BUCKETS!")
                        print(myBuckets)
                        print("ITEM IMAGES COUNT")
                    
                        
                    }
            }        // code
            
    
            
            
            Alamofire.request("http://localhost:3000/users/1/proposals", method: .get, headers: nil)
                .validate(statusCode: 200..<300)
                .responseJSON { response in
//                    print(response.result.value)
                    myProposals.removeAll()
                    
                    if let JSON = response.result.value! as? [[String:Any]] {
                        
//                        print("COUNT")
//                        print(JSON.count)
                        
                      print(JSON)
                            
                            
                        for a in JSON {
                        
                            let prop = Proposal(item: a["item"] as! String, price: a["price"] as! Double, imageString: a["imageString"] as! String)
                            

                        myProposals.append(prop)
                        }
                  
                        print(myProposals)
                    }
            }        // code


        
        
    }
    
    func loadProposals() {
        
        print("what the damn fuck?")
        tableView.reloadData()
    }
    
    func fuckingChrist() {
       
        if myProposals.count > 0 {
            print("fuck off")
            print(myProposals.count)
        }
    }

    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myProposals.count
    }
    
    //MARK: UITableviewDelegate functions
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketCell", for: indexPath) as! bucketListTableCell
        
        
        let prop = myProposals[indexPath.row]
        
        cell.bindData(proposal: prop)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        
        let proposal = myProposals[indexPath.row]
        
   
        
        performSegue(withIdentifier: "proposalShow", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proposalShow" {
                let indexPath = sender as! NSIndexPath
            
            if let nav = segue.destination as? UINavigationController {
                let proposalVC = nav.topViewController as? proposalVC!
                let theProposal = myProposals[indexPath.row]
                proposalVC?.proposal1 = theProposal
            }
        
            
            
            
        }
    }



}
