//
//  LoginUserController.swift
//  TaxationProject
//
//  Created by Sheikh Khawar on 05/10/2016.
//  Copyright © 2016 Sheikh Khawar. All rights reserved.
//

import Foundation
import UIKit

class LoginUserController: UIViewController {
    
    
    
    
    
    @IBOutlet var regUserId: UITextField!
    @IBOutlet var regUserPassword: UITextField!
    
    var isUserId = false
    var isUserPassword = false
    
    @IBAction func userLoginToApp(sender: AnyObject) {
        
       
       
        //Check User ID Field Validity
        
        if(self.regUserId.text! == "") {
            let alert: UIAlertView = UIAlertView(title: "Empty Email Field", message: "Please Enter User ID.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
            
        }
        else{
        
            isUserId = true
            
        }
        //Check User Password Field
        
        if(self.regUserPassword.text! == "") {
            let alert: UIAlertView = UIAlertView(title: "Empty Password Field", message: "Please Enter Password.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
            
        }
        else{
        
            isUserPassword = true
            
        }
       
        
        //let myUrlforlogin:String = Global.baseURL + Global.login
        
        if isUserId == true && isUserPassword == true{
            
            
            
            ShowHideLoading().showLoading()
            let url_to_request:String = "https://socialcalculatorevantrium.herokuapp.com/api/authenticate"
            
            
            
            let url:NSURL = NSURL(string: url_to_request)!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            
            let paramString = "userid=\(self.regUserId.text!)&password=\(self.regUserPassword.text!)"
            request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = session.dataTaskWithRequest(request) {
                (
                let data, let response, let error) in
                
                guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                    print("error")
                    return
                }
                
                let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(dataString)
                
            }
            task.resume()
            
            
            ShowHideLoading().hideLoading()
            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserStartingEarning")
            self.presentViewController(nextViewController!, animated: true, completion: nil)

        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rightSwipe = UISwipeGestureRecognizer(target: self,action: #selector(CreateAccountController.handleSwipes(_:)))
        
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer){
        
        if (sender.direction == .Right){
            
            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserLoginAndSignUp")
            self.presentViewController(nextViewController!, animated: true, completion: nil)
            
        }
        
        
    }

    
    
}
