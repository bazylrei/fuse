//
//  Password+CoreDataProperties.swift
//  Fuse
//
//  Created by Bazyl Reinstein on 06/09/2016.
//  Copyright © 2016 BazylRei. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Password {

    @NSManaged var enabled: NSNumber?
    @NSManaged var secure_field: String?
    @NSManaged var company: Company?

}
