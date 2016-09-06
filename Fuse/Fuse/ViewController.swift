//
//  ViewController.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 05/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textfieldCompany: UITextField!
  @IBOutlet weak var imageViewLogo: UIImageView!
  
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
      CompanyAPI.getCompanyRequest(textField.text!) { (company, error) in
        let companyName = company?.name
        let logo = company?.logo
        dispatch_async(dispatch_get_main_queue(), { [weak self] in
          if error != nil {
            self?.textfieldCompany.backgroundColor = UIColor.redColor()
            self?.resetImageView()
          } else {
            self?.textfieldCompany.backgroundColor = .greenColor()
            self?.textfieldCompany.text = companyName
            self?.imageViewLogo.sd_setImageWithURL(NSURL(string: logo!))
            self?.imageViewLogo.backgroundColor = .whiteColor()
          }
        })
      }
    }
    textfieldCompany.resignFirstResponder()
    return false
  }
  
  @IBAction func textFieldDidEnter(sender: AnyObject) {
    textfieldCompany.backgroundColor = UIColor.whiteColor()
    resetImageView()
  }
  
  func resetImageView() {
    self.imageViewLogo.image = nil
    self.imageViewLogo.backgroundColor = .clearColor()
  }
  
}

