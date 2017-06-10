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

struct Proposal {
    var item: String
    var price: Double?
    var monthly_payments: Double?
    var months: Int?
    
    // [2]
    init(json: [String: Any]) throws {
        guard let item = json["item"] as? String else {
            // [3]
            throw SerializationError.missing("item")
        }
        self.item = item
        price = json["price"] as? Double
        monthly_payments = json["monthly_payments"] as? Double
        months = json["months"] as? Int

    }
}
