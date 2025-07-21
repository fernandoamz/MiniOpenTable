//
//  HomeView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI
import Inject

struct HomeView: View {
  @State private var selectedIndex = 0
  private let tabs = ["Reservaciones", "Experiencias"]
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Text("Buenas Noches").font(.title2).fontWeight(.bold).frame(alignment: .leading)
        Spacer()
        
        Image(systemName: "person.circle.fill")
          .resizable()
          .frame(width: 32, height: 32)
          .foregroundStyle(.secondary)
      }.padding(.bottom, 8)
        .padding(.horizontal, 10)

        HStack(spacing: 24) {
            ForEach(0..<tabs.count, id: \.self) { index in
                VStack(spacing: 4) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedIndex = index
                        }
                    }) {
                        Text(tabs[index])
                            .foregroundColor(selectedIndex == index ? .red : .black)
                            .fontWeight(selectedIndex == index ? .semibold : .regular)
                            .padding(.bottom, 10)
                    }

                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(selectedIndex == index ? .red : .clear)
                        .animation(.easeInOut(duration: 0.2), value: selectedIndex)
                }
            }
          Spacer().frame(width: 80)
        }
        Divider()

        // Full screen content
        ZStack {
            if selectedIndex == 0 {
              ReservationsView()
            } else {
              ExperiencesView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }.enableInjection()
  }
}

#Preview {
    // HomeView()
  RestaurantListView()
}
