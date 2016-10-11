//
//  EarningYearEndController.swift
//  TaxationProject
//
//  Created by Sheikh Khawar on 05/10/2016.
//  Copyright © 2016 Sheikh Khawar. All rights reserved.
//

import UIKit

class EarningYearEndController: UIViewController {
    
    
    @IBOutlet var yearofRetirement: UITextField!
    var startingYear = String()
    var str1 = ""
    
    @IBAction func moveToEnterEarning(sender: UIButton) {
        
//        let secondViewController = storyboard?.instantiateViewControllerWithIdentifier("EnterEarningOnebyOne") as! EnterEarningYearwise
//        secondViewController.endingYear = self.yearofRetirement.text!
//        print(secondViewController.endingYear)
//        print("Khawar.......................................2")
//        self.navigationController?.pushViewController(secondViewController, animated: true)
        let nextViewController = storyboard?.instantiateViewControllerWithIdentifier("EnterEarningOnebyOne")
        self.presentViewController(nextViewController!, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        str1 = startingYear
        print(str1)
        print("Chall Parr bhai.............")
        // Do any additional setup after loading the view.
    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let EarningYearWiseViewController : EnterEarningYearwise = segue.destinationViewController as! EnterEarningYearwise
//        EarningYearWiseViewController.endingYear = self.yearofRetirement.text!
//    }
    

}
