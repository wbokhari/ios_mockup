
//  EarningYearStartControllerViewController.swift
//  TaxationProject
//
//  Created by Sheikh Khawar on 05/10/2016.
//  Copyright © 2016 Sheikh Khawar. All rights reserved.
//

import Foundation
import UIKit

class EarningYearStartController: UIViewController {
    
    @IBOutlet var yearStartEarning: UITextField!
    
    
   
    @IBAction func moveTORetire(sender: AnyObject) {
      
        let str1 = self.yearStartEarning.text!
        let secondViewController = storyboard?.instantiateViewControllerWithIdentifier("RetirementYear") as! EarningYearEndController
        secondViewController.startingYear = str1
        print("------?>>>>",secondViewController.startingYear)
        
        self.presentViewController(secondViewController, animated: true, completion: nil)
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let EarningYearWiseViewController : EnterEarningYearwise = segue.destinationViewController as! EnterEarningYearwise
//        EarningYearWiseViewController.startingYear = self.yearStartEarning.text!
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
