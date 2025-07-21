//
//  NotificationsView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
      VStack {
        Text("History Content").font(.largeTitle)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.white)
    }
}

#Preview {
    NotificationsView()
}
