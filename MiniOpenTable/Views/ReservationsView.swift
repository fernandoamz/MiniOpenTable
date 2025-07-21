//
//  ReservationsView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI


struct Reservations: Identifiable {
  var id: Int
  var name: String
  var foodType: String
  var rating: String
  var time: [String]
}

struct Inspiration: Identifiable {
  var id: Int
  var content: String
}

struct CoockType: Identifiable {
  var id: Int
  var name: String
}

struct Zones: Identifiable {
  var id: Int
  var name: String
}

let todayReservations: [Reservations] = [
  Reservations(
    id: 1,
    name: "Alcalde",
    foodType: "Mexicana",
    rating: "4.5",
    time: ["19:00", "20:00"]
  ),
  Reservations(
    id: 2,
    name: "Alcalde",
    foodType: "Mexicana",
    rating: "4.5",
    time: ["19:00", "20:00"]
  ),
  Reservations(
    id: 3,
    name: "Alcalde",
    foodType: "Mexicana",
    rating: "4.5",
    time: ["19:00", "20:00"]
  ),
]

let todayInspiration: [Inspiration] = [
  Inspiration(id: 1, content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem."),
  Inspiration(id: 2, content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem."),
  ]

let coockType: [CoockType] = [
  CoockType(id: 1, name: "Mexican"),
  CoockType(id: 2, name: "Japanese"),
  CoockType(id: 3, name: "Chinesse"),
  CoockType(id: 4, name: "Tailand"),
]

let zoneList: [Zones] = [
  Zones(id: 1, name: "Zapopan"),
  Zones(id: 2, name: "Tlajomulco"),
  Zones(id: 3, name: "Tlaquepaque"),
  Zones(id: 4, name: "Guadalaajara"),
  Zones(id: 5, name: "Parque Ecológico"),
]

struct ReservationsView: View {
    @StateObject private var viewModel = RestaurantListViewModel()

    var body: some View {
      VStack(spacing: 0) {
          HStack(spacing: 10) {
            CapsuleButton(text: "2 Mañana a 7 P.M.", systemImageLeft: "person") {
              print("Botón presionado")
            }
            
            CapsuleButton(text: "Manzanillo", systemImageLeft: "mappin.and.ellipse") {
              print("Data presionada")
            }
          }
          .padding(.horizontal, 10)
          .frame(maxWidth: .infinity, alignment: .leading)

          if (todayReservations.count == 0) {
            Image(systemName: "house")
              .resizable()
              .frame(width: 32, height: 28)
              .foregroundColor(.gray)
            
            Text("Oh, Oh!")
              .font(.title3)
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
            
            Text("No se encontraron resultados de sugerencia cerca de ti. Intenta con otra ubicacion")
              .font(.title3)
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
            
            Spacer()
          } else {
            ScrollView() {
              HStack {
                Text("Comida al aire libre")
                  .fontWeight(.bold)
                Spacer()
                
                Text("VER TODOS")
                  .foregroundColor(.red)
                  .fontWeight(.bold)
                  .font(.system(size: 13))
              }.padding(.horizontal, 10)
              
              ScrollView(.horizontal) {
                HStack {
                  ForEach(todayReservations, id: \.id) { reservation in
                    CardSmall(
                      title: reservation.name,
                      subtitle: reservation.foodType,
                      reservations: reservation.time
                    )
                  }
                }
                .padding(.bottom, 20)
                // .frame(maxWidth: .infinity)
              }
              .scrollIndicators(.hidden)
              .padding(.horizontal, 5)
              
              VStack( ) {
                HStack {
                  Text("Comida al aire libre")
                    .fontWeight(.bold)
                  Spacer()
                  
                  Text("VER TODOS")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .font(.system(size: 13))
                }.padding(.horizontal, 10)
                
                ScrollView(.horizontal) {
                  HStack {
                    ForEach(todayReservations, id: \.id) { reservation in
                      CardSmall(
                        title: reservation.name,
                        subtitle: reservation.foodType,
                        reservations: reservation.time
                      )
                    }
                  }
                  .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 5)
                
                VStack(spacing: 1) {
                  VStack {
                    HStack {
                      Text("Inspirate")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                      Spacer()
                    }
                  }
                  .padding(.horizontal, 10)
                  
                  ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                      ForEach(todayInspiration, id: \.id) { todayInspiration in
                        LongCard(content: todayInspiration.content)
                      }
                    }
                    .padding(.vertical, 35)
                    .padding(.horizontal, 8)
                  }
                }
              }
              
              VStack {
                HStack {
                  Text("Buscar por tipo de cocina")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                  
                  Spacer()
                  Text("VER TODOS")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .font(.system(size: 13))
                }
                .padding(.horizontal, 10)
                
                ScrollView(.horizontal) {
                  HStack {
                    ForEach(coockType, id: \.id) { coock in
                      VStack {
                        Image("BusinessDinner")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                          Text(coock.name)
                          .fontWeight(.semibold)
                          .font(.system(size: 13))
                      }
                      .padding(.horizontal, 8)
                    }
                    .padding(.vertical, 10)
                  }
                }
                .scrollIndicators(.hidden)
              }
              
              VStack {
                HStack {
                  Text("Explorar la zona")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                  
                  Spacer()
                }
                .padding(.horizontal, 10)
                
                ScrollView(.horizontal) {
                    HStack {
                      ForEach(zoneList) { zone in
                        PrimarySmallButton(text: zone.name) {
                          print("Here is")
                        }
                      }
                    }
                  }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 10)
              }
              .padding(.vertical, 15)

            }
            .scrollIndicators(.hidden)
          }
        
        }
        .task {
          await viewModel.loadRestaurants()
        }
      }
}

#Preview {
  // HomeView()
  RestaurantListView()
}

