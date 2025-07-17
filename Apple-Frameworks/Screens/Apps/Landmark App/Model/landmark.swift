//
//  landmark.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/07/25.
//

import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable {
   var id: Int
   var name: String
   var category: String
   var city: String
   var state: String
   var isFeatured: Bool
   var isFavorite: Bool
   var park: String
   var description: String
   var coordinates: Coordinates
   var imageName: String
   
   var image: Image {
      Image("SVP/\(imageName)")
   }
   
   var locationCoordinate: CLLocationCoordinate2D {
      CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
   }
   
   struct Coordinates: Codable, Hashable {
      let latitude: Double
      let longitude: Double
   }
   
   static var mock: Landmark {
           Landmark(
               id: 1,
               name: "Statue of Unity",
               category: "Monument",
               city: "Kevadia",
               state: "Gujarat",
               isFeatured: true,
               isFavorite: false,
               park: "Sardar Sarovar",
               description: "The Statue of Unity is the world's tallest statue.",
               coordinates: Coordinates(latitude: 21.8385, longitude: 73.7193),
               imageName: "svp"
           )
       }
}

