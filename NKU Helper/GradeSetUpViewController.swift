//
//  GradeSetUpViewController.swift
//  NKU Helper
//
//  Created by 陈乐天 on 15/2/14.
//  Copyright (c) 2015年 陈乐天. All rights reserved.
//

import UIKit

class GradeSetUpViewController: UIViewController {

    var gradeResult:NSArray = NSArray()
    
    @IBOutlet var ValidateCodeImageView: UIImageView!
    
    @IBOutlet var ValidateCodeTextField: UITextField!
    override func viewDidLoad() {
        
        ValidateCodeTextField.becomeFirstResponder()
        var validateCodeGetter:imageGetter = imageGetter()
        validateCodeGetter.getImageWithBlock { (data, err) -> Void in
            if let temp = err {
                print("Validate Loading Error!\n")
            }
            else {
                print("Validate Loading Succeed!\n")
                self.ValidateCodeImageView.image = UIImage(data: data!)
            }
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
        
        var 😌gradeGetter:GradeGetter = GradeGetter()
        😌gradeGetter.getGrade("1410159", password: "110089", validateCode: ValidateCodeTextField.text) { (result) -> Void in
            
            self.gradeResult = result
            self.performSegueWithIdentifier("ShowGrade", sender: nil)

            
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowGrade" {
            var destination:GradeShowerTableViewController = segue.destinationViewController as GradeShowerTableViewController
            destination.gradeResult = self.gradeResult
        }
        
    }
    
}

