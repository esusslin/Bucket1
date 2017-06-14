//
//  Search.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/9/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//
import Alamofire


class Search {
    
    
    
    
    
    static func requestProposals() {
        
//        var proposals: [Proposal] = []

        
        Alamofire.request("https://calm-castle-11120.herokuapp.com/proposals", method: .get, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
        }        // code
}
    
    
    static func postProposals() {
        
//        let params = ["item": "e", "price": "23", "monthly_payments": "232", "months": "23423"]
        
        
        let parameters: Parameters = [
            "proposal": ["item": "e", "price": "23", "monthly_payments": "232", "months": "23423"]
        ]
        
        Alamofire.request("https://calm-castle-11120.herokuapp.com/proposals", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
        }        // code
    }
    
    static func posturl(url: String) {
        
       let parameters: Parameters = ["url": url, "user_id": user_id]
        
        Alamofire.request("https://calm-castle-11120.herokuapp.com/proposals/url", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
        }        // code
    }
    
    static func newUser(first_name: String) {
        
        print("******")
        print(first_name)
        print("******")
        
//        var proposals: [Proposal] = []
        
        let parameters: Parameters = [
                "user": ["first_name": first_name]
            ]

        
        Alamofire.request("https://calm-castle-11120.herokuapp.com/users", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
                
                 if let JSON = response.result.value as? [String:Any] {
                    print("JSON: \(JSON)")
                    
//                    let json = try JSONSerialization.jsonObject(with: JSON, options:.allowFragments) as! [String:AnyObject]
                    
                     let idString = String(describing: JSON["id"] as! NSNumber)
                    
                   user_id = idString
                    
                }
                
                
                
                print("******")
//               print(user_id!)
                print("******")
        }
    }

    static func getUserDefaults(user_id: String) {
        
        print("******")
        print(user_id)
        print("******")
        
        
        let url = "https://calm-castle-11120.herokuapp.com/users/" + user_id
        
        print("**************")
        print(url)
        print("**************")
        
        
        Alamofire.request(url, method: .get, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
                
                
                
                if let JSON = response.result.value as? [String:Any] {
                    print("JSON: \(JSON)")

                  let first_name_ = JSON["first_name"] as? String!
                    let last_name_ = JSON["last_name"] as? String!
                    let checking_acct_ = JSON["checking_acct"] as? Double!
                    let savings_acct_ = JSON["savings_acct"] as? Double!
                    let monthly_ = JSON["monthly"] as? Double!
                    
                
                    
                    first_name = first_name_!
                    last_name = last_name_!
                    checking_acct = Double(String(format: "%.2f", checking_acct_!))!
                    savings_acct = Double(String(format: "%.2f", savings_acct_!))!
                    monthly = Double(String(format: "%.2f", monthly_!))!
                    
                }
                print(first_name)
                print(last_name)
                print(checking_acct)
        }        // code
    }




}
