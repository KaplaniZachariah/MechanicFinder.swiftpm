import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            Button {
                MechanicSearchView()
            } label: {
                Text("Find a Mechanic")
                    .frame(width: 150, height: 75)
                    .clipShape(Capsule())
                    .foregroundColor(.blue)
            }
            
            Button {
                ShoppingCartView()
            } label: {
                Text("My Shopping Cart")
                    .frame(width: 150, height: 75)
                    .clipShape(Capsule())
                    .foregroundColor(.blue)
            }
            
            
        }
    }
}
