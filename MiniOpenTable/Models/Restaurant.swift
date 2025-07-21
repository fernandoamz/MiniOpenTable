//
//  Restaurant.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 15/07/25.
//

struct Restaurant: Identifiable, Decodable {
  let id: Int
  let name: String
  let cuisine: String
  let rating: Double
  let imageUrl: String
  let availableTimes: [String]
}
