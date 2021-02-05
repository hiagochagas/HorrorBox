//
//  MovieAPIRequest.swift
//  HorrorBox
//
//  Created by Hiago Chagas on 05/02/21.
//

import Foundation

class MovieAPIRequest {
    func fetchMovies(completionHandler: @escaping (Result) -> Void) {
        let key = "75146b8a4b96fbff1378867d7befc417" //personal developer key
        let horrorGenre = "27" //thats the key to choose a Horror Movie
        let regionLanguage = "en-US" //need to change it later
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(key)&with_genres=\(horrorGenre)&language=\(regionLanguage)") else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? "An error was found")
                return
            }
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(Result.self,from: data!)
                completionHandler(result)
            } catch {
                print(response ?? "A response was found")
                return
            }
        })
        task.resume()

        
    }
}
