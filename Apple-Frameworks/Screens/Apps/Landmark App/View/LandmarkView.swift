//
//  MapKit.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/07/25.
//

import SwiftUI
import MapKit

struct LandmarkView: View {
   @StateObject private var viewModel = LandmarkViewModel()

   var body: some View {
      VStack{
         List {
            ForEach(viewModel.landmarkData, id: \.self) { item in
               NavigationLink(destination: LandmarkDetailView(landmark: item)){
                  VStack {
                     LandmarkRow(landmark: item)
                  }
               }
            }
         }
      }
      .navigationTitle("Landmark")
      .navigationBarTitleDisplayMode(.large)
      .onAppear {
         self.viewModel.setLandmarkData()
      }
   }
}

struct LandmarkRow: View {
   let landmark: Landmark
   
   var body: some View {
      HStack(alignment: .center) {
         landmark.image
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
         
         Text(landmark.name)
            .font(.title3)
         Spacer()
      }
//      .padding()
   }
}

struct LandmarkDetailView: View {
   let landmark: Landmark
   var body: some View {
      ScrollView {
         VStack {
            LandmarkMapKit(coordinate: landmark.locationCoordinate)
               .frame(height: 300)
            ImageView(image: landmark.image)
               .frame(height: 200)
               .offset(y: -110)
               .padding(.bottom, -110)
            LandmarkDetail(landmark: landmark)
         }
      }
   }
}

struct LandmarkDetail: View {
   let landmark: Landmark
   var body: some View {
      
      VStack(alignment: .leading) {
         Text(landmark.name)
            .font(.title)
         HStack {
            Text(landmark.park)
            Spacer()
            Text(landmark.state)
               
         }
         .font(.headline)
         .foregroundStyle(Color.gray)
         Divider()
         Text("About \(landmark.name)")
            .font(.title2)
         Text(landmark.description)
      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal)
   }
}


struct ImageView: View {
   var image: Image
   var body: some View {
      image
         .resizable()
         .scaledToFit()
         .clipShape(Circle())
         .overlay(content: {
            Circle().stroke(Color.white, lineWidth: 5)
               .shadow(radius: 9)
         })
   }
}

struct LandmarkMapKit: View {
   @State var region = MKCoordinateRegion()
   var coordinate: CLLocationCoordinate2D
   func setRegion(_ coordinate: CLLocationCoordinate2D) {
      region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
   }
   var body: some View {
      VStack{
         Map(coordinateRegion: $region )
            .mapStyle(.hybrid)
            .onAppear {
               setRegion(coordinate)
            }
      }
   }
}

#Preview("SVPListView") {
   LandmarkRow(landmark: Landmark.mock)
}

#Preview("SvpDetailView") {
   LandmarkDetailView(landmark: Landmark.mock)
}

#Preview("SvpView") {
   LandmarkView()
}
