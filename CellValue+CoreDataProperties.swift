//
//  CellValue+CoreDataProperties.swift
//  businessLoan
//
//  Created by Yazan Altwil on 5/21/17.
//  Copyright © 2017 Yazan Altwil. All rights reserved.
//

import Foundation
import CoreData


extension CellValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CellValue> {
        return NSFetchRequest<CellValue>(entityName: "CellValue")
    }

    @NSManaged public var value: String?
    @NSManaged public var field: Double

}
