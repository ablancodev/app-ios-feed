/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation

var landmarks: [Post] = load("https://www.ablancodev.com/wp-json/ablancodev/v1/posts/")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let url = URL(string: filename)
        else {
            fatalError("Couldn't find \(filename) as url.")
    }

    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
