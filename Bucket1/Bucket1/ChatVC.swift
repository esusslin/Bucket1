//
//  ChatVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/5/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

final class ChatVC: JSQMessagesViewController {
    
    var channelRef: DatabaseReference?
    var channel: Channel? {
        didSet {
            title = channel?.name
        }
    }
    
    // MARK: Properties
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.senderId = Auth.auth().currentUser?.uid
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Collection view data source (and related) methods
    
    
    // MARK: Firebase related methods
    
    
    // MARK: UI and User Interaction
    
    
    // MARK: UITextViewDelegate methods
    
}
