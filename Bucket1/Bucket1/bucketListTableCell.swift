//
//  bucketListTableCell.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/13/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit

class bucketListTableCell: UITableViewCell {
    
    
    @IBOutlet weak var item: UILabel!
    
    @IBOutlet weak var monthly_payments: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var price: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(proposal: Proposal) {
        
        print(proposal)

        print("load data?")
        
        self.item.text = proposal.item as String
        
        self.price.text = String(proposal.price)
        
        self.duration.text = String(proposal.months) + " mos"
        
        self.monthly_payments.text = "$ " + String(proposal.monthly)
        
        
    }


}
