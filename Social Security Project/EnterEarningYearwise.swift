//
//  EnterEarningYearwise.swift
//  TaxationProject
//
//  Created by Sheikh Khawar on 05/10/2016.
//  Copyright © 2016 Sheikh Khawar. All rights reserved.
//

import UIKit

class EnterEarningYearwise: UIViewController {
    
   // var startingYear = String()
    var endingYear = String()
    var str1 = ""
    var str2 = ""
    @IBOutlet weak var yearEarning: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
//        str1 = startingYear
//        str2 = endingYear
//        print(str1)
//        print(str2)
        //print("Khawar.................................3")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
               //= self.yearEarning.text! = startingYear
                str2 = endingYear
         print("Khawar.................................3")
                print(str1)
         print("Khawar.................................4")
                print(str2)
        print("Khawar.................................5")
        

        
        // We will simply print out the value here
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
