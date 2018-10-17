//
//  CircleView.swift
//  lewis-1
//
//  Created by vriz on 17/10/2018.
//  Copyright © 2018 vriz. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
