//
//  Developer.swift
//  CoreDataDemo
//
//  Created by Pawel Milek on 10/10/16.
//  Copyright © 2016 Pawel Milek. All rights reserved.
//

import Foundation
import CoreData


class Developer: NSManagedObject, Person {
    @NSManaged var name: String
    @NSManaged var age: Int
  
}
