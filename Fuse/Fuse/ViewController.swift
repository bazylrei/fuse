//
//  ViewController.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 05/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//

import UIKit
import SDWebImage
import ReachabilitySwift

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textfieldCompany: UITextField!
  @IBOutlet weak var imageViewLogo: UIImageView!
  var reachability: Reachability!
  override func viewDidLoad() {
    super.viewDidLoad()
    setupReachability()
    textfieldCompany.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    var alertTitle = ""
    var alertText = "Please try again later"
    
    if reachability.isReachable() {
      var text = textField.text!
      text = text.stringByReplacingOccurrencesOfString(" ", withString: "")
      if text.characters.count > 1 {
        CompanyAPI.getCompanyRequest(text) { (company, error) in
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
      } else {
        alertTitle = "Company name must consist of more than 1 character"
      }
    } else {
      alertTitle = "Internect connection unreachable"
    }
    
    if alertTitle.characters.count > 0 {
      presentAlertWithTitle(alertTitle, text: alertText)
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
  
  func presentAlertWithTitle(title: String, text: String) {
    let controller = UIAlertController(title: title, message: text, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    controller.addAction(action)
    self.presentViewController(controller, animated: true, completion: nil)
  }
  
  func setupReachability() {
    do {
      reachability = try Reachability.reachabilityForInternetConnection()
    } catch {
      print("Reachability has encountered an error")
    }
  }
}

