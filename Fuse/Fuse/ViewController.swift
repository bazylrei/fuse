//
//  ViewController.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 05/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textfieldCompany: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textfieldCompany.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    var text = textField.text!
    text = text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    if text.characters.count > 1 {
      CompanyAPI.getCompanyRequest(textField.text!) { (result, error) in
        dispatch_async(dispatch_get_main_queue(), { [weak self] in
          if error != nil {
            self?.textfieldCompany.backgroundColor = UIColor.redColor()
          } else {
            self?.textfieldCompany.backgroundColor = UIColor.greenColor()
          }
        })
      }
    }
    
    return false
  }
  
}

