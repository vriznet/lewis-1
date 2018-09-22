//
//  FeedView.swift
//  lewis-1
//
//  Created by vriz on 2018. 9. 14..
//  Copyright © 2018년 vriz. All rights reserved.
//

import UIKit

class FeedView: UIView {
    override func awakeFromNib() {
        self.layer.masksToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor(red: 155, green: 155, blue: 155, alpha: 1.0).cgColor
        self.layer.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1.0).cgColor
//        self.layer.shadowColor = UIColor(red: 155, green: 155, blue: 155, alpha: 1.0).cgColor
//        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        self.layer.shadowOpacity = 0.7
//        self.layer.shadowRadius = 5.0
        
    }
}
