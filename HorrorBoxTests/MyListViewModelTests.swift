//
//  MyListViewModelTests.swift
//  HorrorBoxTests
//
//  Created by Hiago Chagas on 11/02/21.
//

import XCTest
import CoreData
@testable import HorrorBox

class MyListViewModelTests: XCTestCase {
    var sut: MyListViewModel!
    
    override func setUp() {
        super.setUp()
        sut = MyListViewModel()
    }
    
    override func tearDown() {
        flushData()
        super.tearDown()
    }
    
    func test_addMovieToMyList_equalToOne() {
        let context = mockPersistantContainer.viewContext
        let moviesBeforeChanges = sut.getMoviesFromCoreData(viewContext: context)
        let movie = Movie(adult: true, backdropPath: "", genreIDS: [], id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 1, posterPath: "", releaseDate: "", title: "", video: true, voteAverage: 1, voteCount: 1)
        sut.addMovie(movie: movie, movieCover: UIImage(), viewContext: context)
        let moviesAfterChanges = sut.getMoviesFromCoreData(viewContext: context)
        XCTAssertNotEqual(moviesBeforeChanges.count, moviesAfterChanges.count)
    }
    func test_addMovieToMyList_removedRepeatedMovie() {
        let context = mockPersistantContainer.viewContext
        let moviesBeforeChanges = sut.getMoviesFromCoreData(viewContext: context)
        let movie = Movie(adult: true, backdropPath: "", genreIDS: [], id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 1, posterPath: "", releaseDate: "", title: "", video: true, voteAverage: 1, voteCount: 1)
        sut.addMovie(movie: movie, movieCover: UIImage(), viewContext: context)
        sut.addMovie(movie: movie, movieCover: UIImage(), viewContext: context)
        let moviesAfterChanges = sut.getMoviesFromCoreData(viewContext: context)

        XCTAssertEqual(moviesBeforeChanges.count, moviesAfterChanges.count)
    }

    //Mockup Persistant Container
    lazy var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: self))] )!
        return managedObjectModel
    }()
    
    lazy var mockPersistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HorrorBoxTest", managedObjectModel: self.managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )

            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
}

extension MyListViewModelTests {
    
    
    func flushData() {
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Film")
            let objs = try! mockPersistantContainer.viewContext.fetch(fetchRequest)
            for case let obj as NSManagedObject in objs {
                mockPersistantContainer.viewContext.delete(obj)
            }
            try! mockPersistantContainer.viewContext.save()
        }
}
