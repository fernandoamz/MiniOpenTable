//
//  RestaurantDetailView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 15/07/25.
//

import Swift
import SwiftUICore
import SwiftUI
import MapKit

@MainActor @preconcurrency
struct RestaurantDetailView: View {
  let restaurant: Restaurant
  
  @State private var selectedTime: String?
  @State private var showAlert = false
  
  let cityHallLocation = CLLocationCoordinate2D(latitude: 37.7793, longitude: -122.4193)
  let publicLibraryLocation = CLLocationCoordinate2D(latitude: 37.7789, longitude: -122.4158)
  let playgroundLocation = CLLocationCoordinate2D(latitude: 37.7804, longitude: -122.4176)

  var body : some View {
    VStack(spacing: 16) {
      AsyncImage(url: URL(string: restaurant.imageUrl)) {
        image in image.resizable()
      } placeholder: {
        Color.gray
      }
      .frame(height: 100)
      .cornerRadius(12)
      
      Map {
          Marker("San Francisco City Hall", coordinate: cityHallLocation)
              .tint(.orange)
          Marker("San Francisco Public Library", coordinate: publicLibraryLocation)
              .tint(.blue)
          Annotation("Diller Civic Center Playground", coordinate: playgroundLocation) {
              ZStack {
                  RoundedRectangle(cornerRadius: 5)
                      .fill(Color.yellow)
                  Text("🛝")
                      .padding(5)
              }
          }
      }
      
      Text(restaurant.name).font(.title2)
      Text("Comida: \(restaurant.cuisine)").foregroundColor(.secondary)
      Text("Rating: ⭐️ \(restaurant.rating, specifier: "%.1f")")
      
      Text("Selecciona un horario")
        .font(.headline)
      
      ForEach(restaurant.availableTimes, id: \.self) { time in
        Button(action: {
          selectedTime = time
        }) {
          Text(time)
            // .padding()
            .frame(maxWidth: .infinity)
        }
      }
      
      if let selected = selectedTime {
        Text("You have been selected: \(selected)")
        Button("Confirm reservation") {
          print("Confirmed reservation for \(selected)")
          showAlert = true
        }
        .alert(isPresented: $showAlert) {
          Alert(title: Text("Reservation confirmed!"))
        }
        .padding()
        .background(Color.green)
        .foregroundColor(.white)
        .cornerRadius(8)
      }
    }
    .padding()
    .navigationTitle(restaurant.name)
  }
}

#Preview {
 RestaurantListView()
}
