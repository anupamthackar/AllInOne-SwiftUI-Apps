//
//  JsonLoader.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/07/25.
//

import Foundation

class LoadJsonData: ObservableObject {
   static let shared = LoadJsonData()
   func loadData<T: Decodable>(_ filename: String, withExtension: String = "json") throws -> T {
      
      guard let fileURL = Bundle.main.url(forResource: filename, withExtension: withExtension) else {
         throw JSONLoadingError.fileNotFound(filename: "\(filename).\(withExtension)")
      }
      
      let data: Data
      do {
         data = try Data(contentsOf: fileURL)
      } catch {
         throw JSONLoadingError.dataLoadingFailed(filename: "\(filename).\(withExtension)", error: error)
      }
      
      do {
         let decoder = JSONDecoder()
         return try decoder.decode(T.self, from: data)
      } catch {
         throw JSONLoadingError.decodingFailed(filename: "\(filename).\(withExtension)", error: error)
      }
   }
}


enum JSONLoadingError: Error, LocalizedError {
   case fileNotFound(filename: String)
   case dataLoadingFailed(filename: String, error: Error)
   case decodingFailed(filename: String, error: Error)
   
   var errorDescription: String? {
      switch self {
      case .fileNotFound(let filename):
         return "Could not find \(filename) in the main bundle."
      case .dataLoadingFailed(let filename, let error):
         return "Failed to load data from \(filename): \(error.localizedDescription)"
      case .decodingFailed(let filename, let error):
         return "Failed to decode \(filename): \(error.localizedDescription)"
      }
   }
}
