//
//  CompanyAPI.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 05/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//

import UIKit
import Alamofire

class CompanyAPI: NSObject {

  class func getCompanyRequest(companyName: String, completion: (result: [AnyObject], error: String?) -> Void) {
    Alamofire.request(.GET, "https://" + companyName + Constants.URLs.findCompanyURL)
      .responseJSON { response in
        switch response.result {
        case .Success:
          guard let JSON = response.result.value else { return }
          print(JSON)
          break
        case .Failure:
          completion(result: [], error: "something went wrong")
        }
    }
  }

  
}
