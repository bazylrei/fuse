//
//  CompanyAPI.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 05/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//

import UIKit
import Alamofire
import MagicalRecord

class CompanyAPI: NSObject {

  class func getCompanyRequest(companyName: String, completion: (result: Company?, error: String?) -> Void) {
    Alamofire.request(.GET, "https://" + companyName + Constants.URLs.findCompanyURL)
      .responseJSON { response in
        switch response.result {
        case .Success:
          print(response.response?.statusCode)
          if response.response?.statusCode == 200{
            guard let JSON = response.result.value else { return }
            print(JSON)
            var company: Company?
            MagicalRecord.saveWithBlock({ (localContext) in
              company = Company.MR_importFromObject(JSON, inContext: localContext)
              }, completion: { (success, error) in
                completion(result: company, error: nil)
            })
          } else {
              completion(result: nil, error: "Company not found")
          }
          break
        case .Failure:
          completion(result: nil, error: "something went wrong")
        }
    }
  }

  
}
