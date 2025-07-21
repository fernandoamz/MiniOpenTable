//
//  RestaurantListViewModel.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 15/07/25.
//

import Foundation

@MainActor
final class RestaurantListViewModel: ObservableObject {
  @Published var restaurants: [Restaurant] = []
  private let service = RestaurantService()
  
  func loadRestaurants() async {
    do {
      restaurants = try await service.fetchRestaurants()
    } catch {
      print("Failed to load \(error)")
    }
  }
}
