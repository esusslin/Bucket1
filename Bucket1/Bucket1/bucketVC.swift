//
//  bucketVC.swift
//  Bucket1
//
//  Created by Emmet Susslin on 6/13/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit
import Alamofire

class bucketVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
   
    
    var itemImages = [UIImage]()
    
    var fullImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        fullImageView = UIImageView()
        fullImageView.contentMode = .scaleAspectFit
        fullImageView.backgroundColor = UIColor.lightGray
        fullImageView.isUserInteractionEnabled = true
        fullImageView.alpha = 0
        self.view.addSubview(fullImageView)
        
        let dismissWihtTap = UITapGestureRecognizer(target: self, action: #selector(hideFullImage))
        fullImageView.addGestureRecognizer(dismissWihtTap)


        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myBuckets.removeAll()
        alamo()
        loadImages()
    }
    
    func alamo() {
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
                }
        }        // code

    }
    
    func loadImages() {
        
        for buck in myBuckets {
            
            
            
            let url = URL(string: buck.imageString)!
            let data = try? Data(contentsOf: url)
            if let imageData = data {
                let image = UIImage(data: data!)!
                
                itemImages.append(image)
            }
            
        }
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var frame = collectionView.frame
        frame.size.height = self.view.frame.size.height
        frame.size.width = self.view.frame.size.width
        frame.origin.x = 0
        frame.origin.y = 0
        collectionView.frame = frame
        fullImageView.frame = collectionView.frame
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myBuckets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! customCell
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 1.5
        cell.layer.borderColor = UIColor.white.cgColor
        

        cell.imageView.image = itemImages[indexPath.row]
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let customCell = cell as! customCell
        customCell.imageView.image = itemImages[indexPath.row]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! customCell
        if let image = cell.imageView.image {
            self.showFullImage(of: image)
        } else {
            print("no photo")
        }
    }

    
    func showFullImage(of image:UIImage) {
        
        fullImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        fullImageView.contentMode = .scaleAspectFit
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{[unowned self] in
            
            self.fullImageView.image = image
            self.fullImageView.alpha = 1
            self.fullImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            }, completion: nil)
    }
    
    
    
    
    func hideFullImage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{[unowned self] in
            self.fullImageView.alpha = 0
            }, completion: nil)
    }
    
//    collec
    



}
