//
//  CreateAccountController.swift
//  TaxationProject
//
//  Created by Sheikh Khawar on 04/10/2016.
//  Copyright © 2016 Sheikh Khawar. All rights reserved.
//

import Foundation
import UIKit
class CreateAccountController: UIViewController {
    
    
    @IBOutlet var userName: UITextField!
   
    @IBOutlet var userEmail: UITextField!
    
    @IBOutlet var userPassword: UITextField!
    
    @IBOutlet var userConfirmPassword: UITextField!
    
    @IBOutlet var userBirthYear: UITextField!
   
    @IBOutlet var userBirthMonth: UITextField!
    
    
   

    
    //Mark: Register & Validate User
    @IBAction func userRegistration(sender: AnyObject) {
        
        var isuserName = false
        var firstPassword = false
        var cnfrmPassword = false
        var isbirthMonth = false
        var isbirthYear = false
        
     
        //Code to Check current year
//        let date = NSDate()
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        //let year =  components.year
        
        //Check Name Field
        
        if self.userName.text! == "" {
            
            let alert: UIAlertView = UIAlertView(title: "Empty Name Field", message: "Please Enter Name Field.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
        
        }
        else{
            
           isuserName = true
        }
        
        //Check Password and Confirm Password
        
        if self.userPassword.text! == self.userConfirmPassword.text! {
            
            firstPassword = true
            
        } else {
            
            let alert: UIAlertView = UIAlertView(title: "Password Mismatch", message: "Please Enter Same Password.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
        }
        
        if(self.userPassword.text! == "" || self.userConfirmPassword.text! == "") {
            let alert: UIAlertView = UIAlertView(title: "Empty Password Field", message: "Please Enter Password.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
            
        } else {
            
            cnfrmPassword = true
        }
        
        //Check Entered Email Validity
        
        let emailReg: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailReg)
        
        if emailTest.evaluateWithObject(self.userEmail.text!) == false {
            let alert: UIAlertView = UIAlertView(title: "Invalid Mail id", message: "Please Enter Valid Email Address.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
        }
        
        //Check Entered Year Validity
//        
//        print(Int(self.userBirthYear.text!)!)
//        let temp = Int(self.userBirthYear.text!)!
//        
//        if temp < year {
//        
//            let alert: UIAlertView = UIAlertView(title: "enter year", message: "Please Enter Valid Year.", delegate: nil, cancelButtonTitle: "okay")
//            alert.show()
//        
//        }
        
        if self.userBirthYear.text! == "" {
            
            
            let alert: UIAlertView = UIAlertView(title: "Empty Year Field", message: "Please Fill Year Field.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
        }
        else{
            
            isbirthYear = true
        
        
        }
        
        //Check Entered Month Validity

        if  (self.userBirthMonth.text! ?? "").isEmpty
        {
            
            let alert: UIAlertView = UIAlertView(title: "Empty Month Field", message: "Please Fill Month Field.", delegate: nil, cancelButtonTitle: "okay")
            alert.show()
         
        }
        else{

            if (Int(self.userBirthMonth.text!)! <= 0 || Int(self.userBirthMonth.text!)! > 12){
                
                        let alert: UIAlertView = UIAlertView(title: "Invalid Month", message: "Please Enter Valid Month.", delegate: nil, cancelButtonTitle: "okay")
                        alert.show()
            
            
            }
        else{
            
                isbirthMonth = true
            
            }
        }
    
        if firstPassword == true && cnfrmPassword == true && emailTest.evaluateWithObject(self.userEmail.text!) == true && isbirthMonth == true && isbirthYear == true &&  isuserName == true {
            
            var strName : String
                strName = self.userName.text!
            var strPassword : String
                strPassword = self.userPassword.text!
            var strEmail : String
               strEmail = self.userEmail.text!
            var strBirthYear : String
                strBirthYear = self.userBirthYear.text!
            var strBirthMonth : String
                strBirthMonth = self.userBirthMonth.text!
            
            //ShowHideLoading().showLoading()
           
            let url_to_request:String = "https://socialcalculatorevantrium.herokuapp.com/api/register"
            
            
            
            let url:NSURL = NSURL(string: url_to_request)!
            let session = NSURLSession.sharedSession()
            
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
            
            let paramString = "userid=\(strName)&password=\(strPassword)&email=\(strEmail)&birthyear=\(strBirthYear)&birthmonth=\(strBirthMonth)"
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
            
           
            //ShowHideLoading().hideLoading()
            let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserLogin")
            self.presentViewController(nextViewController!, animated: true, completion: nil)

        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        let a = UIView()
//        [self.view .addSubview(a)]
//        a.keephieght.equal = 20
//        a.keepwidth.equal = 20
//        
//        a.keepverticallycentered()
//        a.keephorizontallycentered()
//        
//        a.keeptopinset.equal = 0
//        
//        let b = UIView()
//        [self.view .addSubview(a)]
//        b.keepleftoffset(a).equal=10
        
        
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

