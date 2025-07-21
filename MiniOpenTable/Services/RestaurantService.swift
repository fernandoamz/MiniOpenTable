//
//  RestaurantService.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 15/07/25.
//

import Foundation

final class RestaurantService {
  func fetchRestaurants() async throws -> [Restaurant] {
    guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json")  else {
      throw URLError(.badURL)
    }
    
    let data = try Data(contentsOf: url)
    return try JSONDecoder().decode([Restaurant].self, from: data)
  }
}
