//
//  LandingLoginSignUpController.swift
//  TaxationProject
//
//  Created by Sheikh Khawar on 06/10/2016.
//  Copyright © 2016 Sheikh Khawar. All rights reserved.
//
import Foundation
import UIKit

class LandingLoginSignUpController: UIViewController {

    @IBAction func moveToUserLogin(sender: AnyObject) {
        
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserLogin")
        self.presentViewController(nextViewController!, animated: true, completion: nil)
    }
    @IBAction func moveToSignUp(sender: AnyObject) {
        
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserReg")
        self.presentViewController(nextViewController!, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
