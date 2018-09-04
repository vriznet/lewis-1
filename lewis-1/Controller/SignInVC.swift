//
//  ViewController.swift
//  lewis-1
//
//  Created by vriz on 2018. 8. 28..
//  Copyright © 2018년 vriz. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var idPlaceholderLbl: UILabel!
    @IBOutlet weak var pwPlaceholderLbl: UILabel!
    @IBOutlet weak var idTextFieldBGView: UIView!
    @IBOutlet weak var pwTextFieldBGView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextFieldBGView.layer.cornerRadius = 5.0
        pwTextFieldBGView.layer.cornerRadius = 5.0
        
        addDoneButton()
    }
    
    func addDoneButton(){
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: view, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        idTextField.inputAccessoryView = keyboardToolbar
        passwordTextField.inputAccessoryView = keyboardToolbar
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func idTextFieldEditingDidBegin(_ sender: Any) {
        idPlaceholderLbl.isHidden = true
    }
    @IBAction func pwTextFieldEditingDidBegin(_ sender: Any) {
        pwPlaceholderLbl.isHidden = true
    }
    @IBAction func idTextFieldEditingDidEnd(_ sender: Any) {
        if idTextField.text == "" {
            idPlaceholderLbl.isHidden = false
        }
    }
    @IBAction func pwTextFieldEditingDidEnd(_ sender: Any) {
        if passwordTextField.text == "" {
            pwPlaceholderLbl.isHidden = false
        }
    }
}
