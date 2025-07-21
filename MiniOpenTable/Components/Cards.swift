//
//  Cards.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 17/07/25.
//
import SwiftUI

struct CardView: View {
  var title: String
  var price: Int
  var city: String
  var date: String
  var description: String
  
  init(title: String, price: Int, city: String, date: String, description: String) {
    self.title = title
    self.price = price
    self.city = city
    self.date = date
    self.description = description
  }
  
  var body: some View {
    VStack(spacing: 10) {
      Image("BusinessDinner")
        .resizable()
        .frame(width: 300, height: 150)
      
      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.headline)
          .foregroundColor(.primary)
          .fontWeight(.bold)
        
        Text("Cityzen MXN\(price) por persona")
          .font(.system(size: 15))
          .foregroundColor(.gray)
        
        Text(city)
          .font(.system(size: 15))
          .foregroundColor(.secondary)
        
        Text("\(Image(systemName: "calendar")) \(date)")
          .font(.system(size: 16))
          .foregroundColor(.black)
          .padding(.vertical, 5)
        
        Text(description)
          .font(.system(size: 15))
          .foregroundColor(.secondary)
          .multilineTextAlignment(.leading)
          .lineLimit(3)
          .truncationMode(.tail)
      }
      .padding(12)
    }
    .frame(width: 300, height: .infinity)
    .background(Color.white)
    .cornerRadius(9)
    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    .padding(.horizontal, 8)
  }
}

struct MiniCard: View {
  var month: String
  var day: Int
  
  init(month: String, day: Int) {
    self.month = month
    self.day = day
  }
  
  var body: some View {
    VStack(spacing: 0) {
      VStack {
       Text(month)
          .foregroundColor(.white)
        
      }
      .frame(width: 70, height: 22)
      .background(.red)
      .opacity(0.9)
      
      VStack {
        Text("\(day)")
          .frame(width: 70, height: 35)
          .font(.system(size: 20, weight: .bold))
      }
      .background(Color.white)
    }
    .cornerRadius(10)
    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 2, y: 5)
  }
}

struct CardSmall: View {
  let title: String
  let subtitle: String
  let reservations: [String]
  
  var body: some View {
    VStack(spacing: 0) {
      Image("BusinessDinner")
        .resizable()
        .frame(width: .infinity, height: .infinity)
      
      VStack(alignment: .leading) {
        HStack{
          Text("Alcalde")
          Spacer()
          Image(systemName: "bookmark")
            .foregroundColor(.gray)
        }
        .background(Color.white)
        .fontWeight(.bold)
        
        Text("Mexicana")
        
        HStack {
          ForEach(reservations, id: \.self) {  reservation in
            ColoredButton(text: reservation, color: .red, action: {
              
            })
          }
        }
      }
      .padding(7)
    }
    .frame(width: 250, height: 250)
    .background(Color.white)
    .cornerRadius(9)
    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
  }
}

struct LongCard: View {
  let content: String
  
  init(content: String) {
    self.content = content
  }
  
  var body: some View {
    VStack(spacing: 0){
      VStack {
        Image("LoveMeeting")
          .resizable()
          .frame(width: .infinity, height: .infinity)
          .aspectRatio(contentMode: .fill)
          .clipped()
      }
      .frame(width: 360, height: 120)
      
      VStack {
        Text(content)
          .multilineTextAlignment(.leading)
          .fontWeight(.semibold)
          .font(.system(size: 16))
      }
      .frame(width: 360, height: 80)
      .background(Color.white)
    }
    .cornerRadius(5)
    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    .frame(width: 360, height: 170)
  }
}


#Preview {
  /* CardView(
    title: "Sprakling Nights at Cityzen Rooftop Bar",
    price: 1650,
    city: "Juarez/Cuahutemoc, Ciudad de Mexico",
    date: "Miercoles, 16 de Julio",
    description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit."
  )
  
  MiniCard(month: "Jul", day: 16)
  
  CardSmall(
    title: "Hole",
    subtitle: "Mundo",
    reservations: ["5:40", "6:30", "8:00"]
  )
   */
  
  LongCard(content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing")
}
