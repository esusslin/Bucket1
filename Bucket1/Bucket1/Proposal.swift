//
//  Proposal.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/9/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import Foundation

// [1]
enum SerializationError: Error {
    case missing(String)
}


var myProposals = [Proposal]()
//Double(round(1000*x)/1000)

internal class Proposal {
    var item: String
    var price: Double
    var monthly: Double
    var months: Int
    
    let imageString: String
    
    init(item: String, price: Double, imageString: String) {
        self.item = item
        self.price = price
        self.monthly = (price / 8)
        self.months = 8
        self.imageString = imageString
        
        
    }
}



//struct Proposal {
//    var item: String = ""
//    var price: Double = 0.0
//    var monthly_payments: Double = 0.0
//    var months: Int = 0
//    
//    var image: String = ""
//}

//class Proposal : NSObject {
//    
//
//    
//    var item: String?
//    var price: Double?
//    var monthly_payments: Double?
//    var months: Int?
//    
//}

//    // [2]
//    init(json: [String: Any]) throws {
//        guard let item = json["item"] as? String else {
//            // [3]
//            throw SerializationError.missing("item")
//        }
//        self.item = item
//        price = json["price"] as? Double
//        monthly_payments = json["monthly_payments"] as? Double
//        months = json["months"] as? Int
//

