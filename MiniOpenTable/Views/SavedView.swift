//
//  SavedView.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 16/07/25.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
      VStack {
        Text("Saved Content").font(.largeTitle)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.white)
    }
}

#Preview {
    SavedView()
}
