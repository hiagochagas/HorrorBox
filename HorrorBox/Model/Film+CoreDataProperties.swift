//
//  Film+CoreDataProperties.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 10/02/21.
//
//

import Foundation
import CoreData


extension Film {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Film> {
        return NSFetchRequest<Film>(entityName: "Film")
    }

    @NSManaged public var id: Int64
    @NSManaged public var score: Double
    @NSManaged public var originalTitle: String?
    @NSManaged public var movieCover: Data?

}

extension Film : Identifiable {

}
