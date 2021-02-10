//
//  MyListViewModel.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 10/02/21.
//

import CoreData
import UIKit

class MyListViewModel {
    func getMoviesFromCoreData() -> [Film] {
        return Film.fetchAll()
    }
    
    func addMovie(movie: Movie, movieCover: UIImage,viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        let movies = getMoviesFromCoreData()
        var alreadyExists = false
        movies.forEach { movieToDelete in
            if movie.id == movieToDelete.id {
                viewContext.delete(movieToDelete)
                alreadyExists = true
            }
        }
        if(!alreadyExists) {
            let newFilm = Film(context: viewContext)
            newFilm.id = Int64(movie.id)
            newFilm.originalTitle = movie.originalTitle
            newFilm.score = movie.voteAverage
            newFilm.movieCover = movieCover.pngData()
        }
        saveContext(viewContext: viewContext)
    }
    
    func saveContext(viewContext: NSManagedObjectContext) {
        do{
            try viewContext.save()
        } catch {
            print("Error \(error) when saving the data")
        }
    }
}
 
