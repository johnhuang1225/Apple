//
//  Item+CoreDataProperties.swift
//  App12 - CoreData Grocery
//
//  Created by John Huang on 2015/10/31.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var image: NSData?
    @NSManaged var name: String?
    @NSManaged var note: String?
    @NSManaged var qty: String?

}
