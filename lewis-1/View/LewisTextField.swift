//
//  LewisTextField.swift
//  lewis-1
//
//  Created by vriz on 2018. 9. 4..
//  Copyright © 2018년 vriz. All rights reserved.
//

import UIKit

private var lewisTextFieldKey = false

extension UITextField{
    @IBInspectable var lewisTextField: Bool{
        get{
            return lewisTextFieldKey
        }set{
            lewisTextFieldKey = newValue
            if lewisTextFieldKey{
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 5.0
                self.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
                self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
                self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
                self.leftViewMode = .always
                self.rightViewMode = .always
            }else{
                self.layer.cornerRadius = 0
            }
        }
    }
}
