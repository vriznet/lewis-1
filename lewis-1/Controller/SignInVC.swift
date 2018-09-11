//
//  ViewController.swift
//  lewis-1
//
//  Created by vriz on 2018. 8. 28..
//  Copyright © 2018년 vriz. All rights reserved.
//

import UIKit

import Firebase

import FBSDKCoreKit
import FBSDKLoginKit

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
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to authenticate with Firebase - \(error!)")
            } else {
                print("Successfully authenticated with Firebase")
            }
        })
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
    @IBAction func signInBtnPressed(_ sender: Any) {
        if let id = idTextField.text, let pw = passwordTextField.text {
            Auth.auth().signIn(withEmail: id, password: pw) { (user, error) in
                if error == nil {
                    print("Email user authenticated with Firebase")
                } else {
                    Auth.auth().createUser(withEmail: id, password: pw, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with Firebase using Email - \(error!)")
                        }else{
                            print("Successfully authenticated with Firebase using email")
                        }
                    })
                }
            }
        }
    }
    @IBAction func fbLoginBtnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook - \(error!)")
            } else if result?.isCancelled == true {
                print("User cancelled Facebook authentication")
            } else {
                print("Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
}
