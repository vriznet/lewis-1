//
//  FeedCell.swift
//  lewis-1
//
//  Created by vriz on 2018. 9. 14..
//  Copyright © 2018년 vriz. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var cellUIView: UIView!
    
    override func awakeFromNib() {
        cellUIView.layer.masksToBounds = true
        cellUIView.layer.borderWidth = 1
        cellUIView.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0).cgColor
    }

    func configureCell(text: String){
        
    }
}
