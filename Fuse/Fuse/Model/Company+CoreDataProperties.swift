//
//  Company+CoreDataProperties.swift
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

extension Company {

    @NSManaged var custom_color: String?
    @NSManaged var logo: String?
    @NSManaged var name: String?
    @NSManaged var password_changing: Password?

}
