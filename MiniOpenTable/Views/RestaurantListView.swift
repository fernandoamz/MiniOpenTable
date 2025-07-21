import SwiftUI

struct RestaurantListView: View {
  var body: some View {
      VStack {        
        TabView {
          HomeView()
            .tabItem {
              Image(systemName: "house.fill")
              Text("Home")
            }
          
          SearchView()
            .tabItem {
              Image(systemName: "magnifyingglass")
              Text("Search")
            }
          
          SavedView()
            .tabItem {
              Image(systemName: "bookmark.fill")
              Text("Saved")
            }
          
          HistoryView()
            .tabItem {
              Image(systemName: "clock")
              Text("History")
            }
          
          NotificationsView()
            .tabItem {
              Image(systemName: "bell")
              Text("Notifications")
            }
        }
      }
    }
  }

#Preview {
  RestaurantListView()
}
