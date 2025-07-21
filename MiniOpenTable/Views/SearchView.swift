//
//  SearchView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI
import MapKit

struct SearchView: View {
   @StateObject private var viewModel = RestaurantListViewModel()
  
   let cityHallLocation = CLLocationCoordinate2D(latitude: 37.7793, longitude: -122.4193)

   let publicLibraryLocation = CLLocationCoordinate2D(latitude:  37.780, longitude: -122.4160)

   let playgroundLocation = CLLocationCoordinate2D(latitude: 37.7806, longitude: -122.4180)
  
  @State private var offset: CGFloat = 450
  @GestureState private var dragOffset: CGFloat = 0

  let minOffset: CGFloat = 180
  let maxOffset: CGFloat = 500
  
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .top) {
        Map {
          Annotation("City Hall", coordinate: cityHallLocation) {
            Circle()
              .fill(Color.red)
              .frame(width: 30, height: 30)
              .overlay(
                Circle().stroke(Color.white, lineWidth: 2)
              )
              .shadow(radius: 2)
          }
          
          Annotation("San Francisco Public Library", coordinate: publicLibraryLocation) {
            Circle()
              .fill(Color.red)
              .frame(width: 30, height: 30)
              .overlay(
                Circle().stroke(Color.white, lineWidth: 2)
              )
              .shadow(radius: 2)
          }
          
          Annotation("Diller Civic Center Playground", coordinate: playgroundLocation) {
            Circle()
              .fill(Color.red)
              .frame(width: 30, height: 30)
              .overlay(
                Circle().stroke(Color.white, lineWidth: 2)
              )
              .shadow(radius: 2)
          }
        }.ignoresSafeArea()
        
        
        VStack {
          HStack {
            CapsuleButton(text: "2 Esta Noche a 7:00", systemImageLeft: "person", systemImageRight: "") {
              
            }
          }
          
          HStack {
            Image(systemName: "magnifyingglass")
              .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
              .foregroundColor(.black)
          }
          .padding(.vertical, 10)
          .padding(.horizontal, 10)
          .background(Color.white)
          .cornerRadius(10)
          .overlay(
            RoundedRectangle(
              cornerRadius: 10
            )
            .stroke(Color.gray, lineWidth: 1)
          )
          .padding(.horizontal)
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
              CapsuleButton(systemImageLeft: "slider.vertical.3", systemImageRight: "") { }
              CapsuleButton(text: "Cocina", systemImageRight: "chevron.down") { }
              CapsuleButton(text: "Galardonado", systemImageRight: "chevron.down") { }
              CapsuleButton(text: "Asientos", systemImageRight: "chevron.down") { }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
          }
        }
        
        BottomSheetContentView(viewModel: viewModel)
          .frame(height: geometry.size.height)
          .offset(y: max(min(offset + dragOffset, maxOffset), minOffset))
                             
          .gesture(
            DragGesture()
              .updating($dragOffset) {
                value, State, _ in
                State = value.translation.height
              }
              .onEnded { value in
                let newOffset = offset + value.translation.height
                let snapPoints: [CGFloat] = [100, 450, geometry.size.height * 85]
                
                let nearest = snapPoints.min(by: {
                  abs($0 - newOffset) < abs($1 - newOffset)
                }) ?? 450
                
                withAnimation {
                  offset = nearest
                }
             }
          )
          .ignoresSafeArea(edges: .bottom)
        
      }
    }
    .task {
      await viewModel.loadRestaurants()
    }
  }
}

struct BottomSheetContentView: View {
  @ObservedObject var viewModel: RestaurantListViewModel
  @State private var selectedRestaurant: Restaurant? = nil
  @State private var showDetail = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Spacer()
        Capsule()
          .frame(width: 40, height: 6)
          .foregroundColor(.gray.opacity(0.5))
        Spacer()
      }.padding(.top, 10)
      
      Text("2 Restaurantes")
        .font(.system(size: 15))
        .fontWeight(.bold)
        .foregroundColor(.black)
        .padding(.horizontal, 18)
      
      List {
        ForEach(viewModel.restaurants) { restaurant in
          HStack {
            VStack(alignment: .leading, spacing: 2) {
              Text(restaurant.name)
                .font(.headline)
              
              Text("⭐️ ⭐️ ⭐️ ⭐️ \(restaurant.rating, specifier: "%.1f")")
                .font(.system(size: 13))
              
              Text("\(Image(systemName: "location.fill")) 3.7 Condesa/Roma")
                .font(.system(size: 13))
              
              Text("$$$$ - \(restaurant.cuisine)")
                .foregroundColor(.black)
                .font(.system(size: 13))
              
              Text("Asientos: Estandar, Bar")
                .font(.system(size: 13))
              
              HStack {
                ForEach(restaurant.availableTimes, id: \.self) {
                  time in
                  ColoredButton(text: "\(time)", action: {
                    print()
                  })
                  .padding(.top, 5)
                }
              }
              
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: restaurant.imageUrl)) { image in
              image.resizable()
            } placeholder: {
              Color.gray
            }
            .frame(width: 90, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.bottom, 30)
          }
          .contentShape(Rectangle())
          .onTapGesture {
            selectedRestaurant = restaurant
            showDetail = true
          }
        }
        .scrollContentBackground(.hidden)
      }
      .listStyle(.plain)
      .scrollContentBackground(.hidden)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .background(.white)
    .cornerRadius(10)
    .sheet(isPresented: $showDetail) {
          if let restaurant = selectedRestaurant {
            RestaurantDetailView(restaurant: restaurant)
          }
      }
    }
  }

#Preview {
  SearchView()
  // RestaurantListView()
}
