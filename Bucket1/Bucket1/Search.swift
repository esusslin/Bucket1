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
        
        var proposals: [Proposal] = []

        
        Alamofire.request("http://localhost:3000/proposals", method: .get, headers: nil)
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
        
        Alamofire.request("http://localhost:3000/proposals", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
        }        // code
    }
    
    static func posturl(url: String) {
        
       let parameters: Parameters = ["url": url]
        
        Alamofire.request("http://localhost:3000/props/url", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseJSON() { response in
                print(response)
        }        // code
    }



}
