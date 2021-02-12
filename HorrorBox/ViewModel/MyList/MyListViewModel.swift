//
//  MyListViewModel.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 10/02/21.
//

import CoreData
import UIKit

class MyListViewModel {
    func getMoviesFromCoreData(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Film] {
        return Film.fetchAll(viewContext: viewContext)
    }
    
    func addMovie(movie: Movie, movieCover: UIImage,viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        let movies = getMoviesFromCoreData(viewContext: viewContext)
        var alreadyExists = false
        movies.forEach { movieToDelete in
            if movie.id ?? 0 == movieToDelete.id {
                viewContext.delete(movieToDelete)
                alreadyExists = true
            }
        }
        if(!alreadyExists) {
            let newFilm = Film(context: viewContext)
            newFilm.id = Int64(movie.id ?? 0)
            newFilm.originalTitle = movie.originalTitle
            newFilm.score = movie.voteAverage ?? 0
            newFilm.movieCover = movieCover.pngData()
        }
        saveContext(viewContext: viewContext)
    }
    
    func deleteMovie(movie: Film, viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        viewContext.delete(movie)
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
 
