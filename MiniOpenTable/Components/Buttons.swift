//
//  SharedComponents.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI

struct CapsuleButton: View {
  let text: String?
  let systemImageLeft: String?
  let systemImageRight: String?
  let action: () -> Void
  
  init(text: String? = nil,
       systemImageLeft: String? = nil,
       systemImageRight: String? = nil,
       action: @escaping () -> Void) {
    self.text = text
    self.systemImageLeft = systemImageLeft
    self.systemImageRight = systemImageRight
    self.action = action
  }
  
  @ViewBuilder
  var body: some View {
    Button(action: action) {
      HStack(spacing: (systemImageLeft != nil && text != nil && systemImageRight != nil) ? 4 : 0) {
        if let systemImageLeft = (systemImageLeft) {
          Image(systemName: systemImageLeft)
            .font(.system(size: 16))
            .padding(.horizontal, 4)
            .padding(.vertical, 4)
            .foregroundColor(.black)
        }
        
        if let text = (text) {
          Text(text)
            .font(.system(size: 14))
            .padding(.vertical, 4)
            .padding(.horizontal, 4)
            .foregroundColor(.black)
        }
        
        if let systemImageRight = (systemImageRight) {
          Image(systemName: systemImageRight)
            .font(.system(size: 16))
            .padding(.horizontal, 4)
            .foregroundColor(.black)
        }
      }
      .padding(.horizontal, 8)
      .padding(.vertical, 6)
      .foregroundColor(.gray)
      .background(Color.white)
      .clipShape(Capsule())
      .overlay(
        Capsule()
          .stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
      )
    }
    .padding(.vertical, 12)
  }
}

struct ColoredButton: View {
  let text: String
  let color: Color
  let action: () -> Void
  
  init(text: String = "", color: Color = .red, action: @escaping () -> Void) {
    self.text = text
    self.color = color
    self.action = action
  }
  
  @ViewBuilder
  var body: some View {
    Button(action: action) {
      HStack{
        Text(text)
          .font(.system(size: 12))
          .padding(.vertical, 8)
          .padding(.horizontal, 8)
          .foregroundColor(.white)
          .fontWeight(.bold)
      }
      .background(color.opacity(0.7))
      .frame(width: .infinity, height: .infinity)
      .cornerRadius(5)
    }
  }
}

struct PrimaryButton: View {
  let text: String
  let action: () -> Void
  
  init (text: String = "", action: @escaping() -> Void) {
    self.text = text
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      HStack{
        Text(text)
          .font(.system(size: 17))
          .padding(.horizontal,125)
          .padding(.vertical, 15)
          .foregroundColor(.gray)
          .fontWeight(.bold)
      }
      .frame(width: .infinity, height: .infinity)
      .cornerRadius(5)
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(Color.gray, lineWidth: 1)
      )
    }
  }
}

struct PrimarySmallButton: View {
  let text: String
  let action: () -> Void
  
  init (text: String = "", action: @escaping() -> Void) {
    self.text = text
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text("\(text)")
        .font(.system(size: 15))
        .padding(.vertical, 13)
        .padding(.horizontal, 30)
        .fontWeight(.semibold)
        .foregroundColor(.black)
    }
    .overlay(
      RoundedRectangle(cornerRadius: 5)
        .stroke(Color.gray, lineWidth: 1)
    )
  }
}


#Preview {
  CapsuleButton(text: "Cocina", systemImageRight: "chevron.down") {
    print("data")
  }
  
  ColoredButton(text: "Colored", action: {
    print("data")
  })
  
  PrimaryButton(text: "Ver Todos", action: {
    print("data")
  })
  
  PrimarySmallButton(text: "Zapopan", action: {
    
  })
}
