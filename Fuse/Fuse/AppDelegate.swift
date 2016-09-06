//
//  AppDelegate.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 05/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//

import UIKit
import CoreData
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    MagicalRecord.setupCoreDataStack()
    return true
  }


  func applicationWillTerminate(application: UIApplication) {
    MagicalRecord.cleanUp()
  }
}

