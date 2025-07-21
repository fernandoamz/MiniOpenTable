//
//  ExperiencesView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI

struct Experience: Identifiable {
  let id = UUID()
  let title: String
  let price: String
  let ubication: String
  let day: Int
  let month: String
}

let todayExperiences: [Experience] = [
  Experience(title: "Clasico Tea Time", price: "$50", ubication: "Polanco/Neva Anzures, Ciudad de Mexico", day: 16, month: "Jul"),
  Experience(title: "Tequila Tasting", price: "$40", ubication: "Roma", day: 18, month: "Ago"),
  Experience(title: "Art Walk", price: "$30", ubication: "Coyoacan", day: 14, month: "Feb"),
  Experience(title: "Art Published", price: "$40", ubication: "La condesa", day: 22, month: "Sep")
]

struct ExperiencesView: View {
  var body: some View {
    VStack {
      HStack {
        CapsuleButton(text: "2", systemImageRight: "person") {}
        
        CapsuleButton(text: "Mexico City, CDMX", systemImageLeft: "location") {}
        Spacer()
      }.padding(.horizontal, 10)
      Spacer()
      
      ScrollView {
        
        
        HStack {
          Text("Destacados")
            .fontWeight(.bold)
            .fontWeight(.bold)
            .font(.system(size: 18))
          
          Spacer()
          
          Text("VER TODOS")
            .foregroundColor(.red)
            .fontWeight(.bold)
            .font(.system(size: 14))
        }
        .padding(.horizontal, 12)
        
        ScrollView(.horizontal) {
          HStack {
            CardView(
              title: "Sprakling Nights at Cityzen Rooftop Bar",
              price: 1650,
              city: "Juarez/Cuahutemoc, Ciudad de Mexico",
              date: "Miercoles, 16 de Julio",
              description: "Lorem ipsum dolor sit amet consectetur adipisicing elit."
            )
            CardView(
              title: "Sprakling Nights at Cityzen Rooftop Bar",
              price: 1650,
              city: "Juarez/Cuahutemoc, Ciudad de Mexico",
              date: "Miercoles, 16 de Julio",
              description: "Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit."
            )
            CardView(
              title: "Sprakling Nights at Cityzen Rooftop Bar",
              price: 1650,
              city: "Juarez/Cuahutemoc, Ciudad de Mexico",
              date: "Miercoles, 16 de Julio",
              description: "Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit."
            )
            CardView(
              title: "Sprakling Nights at Cityzen Rooftop Bar",
              price: 1650,
              city: "Juarez/Cuahutemoc, Ciudad de Mexico",
              date: "Miercoles, 16 de Julio",
              description: "Lorem ipsum dolor sit amet consectetur adipisicing elit."
            )
          }
          .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
        // Spacer()
        
        HStack {
          Text("Experiencias de Hoy")
            .fontWeight(.bold)
            .font(.system(size: 20))
          
          Spacer()
        }
        .padding(.horizontal, 20)
        
        LazyVStack {
          ForEach(Array(todayExperiences.enumerated()), id: \.element.id) { index, experience in
            HStack {
              VStack(alignment: .leading) {
                Text(experience.title)
                  .font(.headline)
                
                Text("Lilou - MXN \(experience.price) por grupo")
                  .font(.caption)
                  .foregroundColor(.gray)
                
                Text(experience.ubication)
                  .font(.caption)
                  .foregroundColor(.gray)
              }
              
              Spacer()
              MiniCard(month: experience.month, day: experience.day)
                .padding(.top, 15)
            }
            .overlay(
              Rectangle()
                .frame(height: 1)
                .opacity(0.3)
                .foregroundColor(.gray),
              alignment: .top
            )
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            
            if index == todayExperiences.count - 1 {
              HStack {
                Spacer()
                PrimaryButton(text: "Ver Todas") {}
                Spacer()
              }
              .padding(.top, 15)
              .overlay(
                Rectangle()
                  .frame(height: 1)
                  .opacity(0.3)
                  .foregroundColor(.gray),
                alignment: .top
              )
            }
          }
        }
        .padding(.horizontal, 10)
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.white)
    }
  }
}

#Preview {
  ExperiencesView()
  // RestaurantListView()
}
