//
//  ContentView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 15/07/25.
//

import SwiftUI
import Inject

struct ContentView: View {
    var body: some View {
      RestaurantListView()
        .enableInjection()
    }
}

#Preview {
    ContentView()
}
