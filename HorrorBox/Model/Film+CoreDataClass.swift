//
//  Film+CoreDataClass.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 10/02/21.
//
//

import Foundation
import CoreData

@objc(Film)
public class Film: NSManagedObject {
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Film] {
            let request : NSFetchRequest<Film> = Film.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            guard let films = try? viewContext.fetch(request) else {
                return []
            }
            return films
        }
        static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
            Film.fetchAll(viewContext: viewContext).forEach({ viewContext.delete($0) })
            try? viewContext.save()
        }
}
