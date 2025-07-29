//
//  SVPViewModel.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/07/25.
//

import Foundation

class LandmarkViewModel: ObservableObject {
   @Published var landmarkData: [Landmark] = []
   private let jsonLoader: LoadJsonData
   
   init(jsonLoader: LoadJsonData = LoadJsonData.shared) {
      self.jsonLoader = jsonLoader
   }
   
   func setLandmarkData() {
      do {
         self.landmarkData = try jsonLoader.loadData("landmarkData")
      } catch {
         print("Failed to load landmark data: \(error)")
         self.landmarkData = [] // Fallback to empty array
      }
   }
}

