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
            
            let request = NSMutableURLRequest(URL: NSURL(string: "https://socialcalculatorevantrium.herokuapp.com/api/authenticate")!)
            request.HTTPMethod = "POST"
            let postString = "userid=\(self.regUserId.text!)&password=\(self.regUserPassword.text!)"
            ShowHideLoading().showLoading()
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
                guard error == nil && data != nil else {                                                          // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                let responseString = String(data: data!, encoding: NSUTF8StringEncoding)
                print("responseString = \(responseString)")
                ShowHideLoading().hideLoading()
                let success = responseString
                if success == "true" {
                    
                    
                    let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserStartingEarning")
                    self.presentViewController(nextViewController!, animated: true, completion: nil)
                }
                else {
                    
                    let alert: UIAlertView = UIAlertView(title: "Invalid UserId/Password", message: "Please Enter Registered User or Password.", delegate: nil, cancelButtonTitle: "okay")
                    alert.show()
                    
                }

            }
            task.resume()
            
//        let myDictionary : [String:String] = [
//            
//                                              "userid" : self.regUserId.text!.lowercaseString,
//                                              "password" : self.regUserPassword.text!
//                                              
//        // "cnfrmpassword" : self.userConfirmPassword.text!,
//            
//            
//        ]
//        ShowHideLoading().showLoading()
//        let manager1 = AFHTTPSessionManager()
//        manager1.requestSerializer = AFJSONRequestSerializer()
//        manager1.responseSerializer = AFJSONResponseSerializer()
//        let url = "https://socialcalculatorevantrium.herokuapp.com/api/authenticate"
//        manager1.POST(url, parameters: myDictionary, success: {(operation: NSURLSessionDataTask?, responseObject: AnyObject?) -> Void in
// 
//            print(responseObject!)
//            ShowHideLoading().hideLoading() 
//            let success = responseObject?["success"] as! String
//            
//            if success == "true" {
//                
//                
//                let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserStartingEarning")
//                self.presentViewController(nextViewController!, animated: true, completion: nil)
//            }
//            else {
//                
//                let alert: UIAlertView = UIAlertView(title: "Invalid UserId/Password", message: "Please Enter Registered User or Password.", delegate: nil, cancelButtonTitle: "okay")
//                alert.show()
//                
//            }
//        
//        
//            }, failure: {(operation: NSURLSessionDataTask?, error: NSError?) -> Void in
//                //Global.hideLoader()
//                print(error)
//                let statusCode = error?.code
//                if(statusCode == 401)
//                {
//                    let alert = UIAlertView(title: "Unauthorized Error", message: "Access is denied due to invalid credentials.", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                }
//                else if (statusCode == 404)
//                {
//                    //                    let alert = UIAlertView(title: "Page Not Found", message: "Page could not be found on the server.", delegate: nil, cancelButtonTitle: "OK")
//                    //                    alert.show()
//                }
//                else if (statusCode == NSURLErrorTimedOut)
//                {
//                    let alert = UIAlertView(title: "Connection timed out", message: "Please try again", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                }
//                else if (statusCode == -1004)
//                {
//                    let alert = UIAlertView(title: "Could not connect to the server", message: "Please try again", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                }
//                else if (statusCode == -1009)
//                {
//                    let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                }
//                else if (statusCode == 504)
//                {
//                    let alert = UIAlertView(title: "Request Failed", message: "Gateway time out, Please try again", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                }
//                else
//                {
//                    let alert = UIAlertView(title: "Server is not responding right now", message: "Please try again", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                    
//                }
//            })

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
