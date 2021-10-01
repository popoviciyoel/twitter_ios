//
//  LoginViewController.swift
//  Twitter
//
//  Created by Yoel Popovici on 9/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoginIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    
    }
        
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            
            // Keeps user login in peristent, remebers user is login in if he close App
            UserDefaults.standard.set(true, forKey: "userLoginIn")
            
            // Transition from login screen to home screen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            
            
        }, failure:{(Error) in
        print("failed to login")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
