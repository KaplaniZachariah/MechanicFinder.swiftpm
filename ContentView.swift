import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 250)
                    .foregroundColor(.blue)
                VStack{
                    Image(systemName: "car.side.front.open.fill")
                        .scaleEffect(6)
                        .foregroundColor(.black)
                        .padding(20)
                    Text("Mechanic Finder")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(20)
                }
            }
            
            Button {
                MechanicSearchView()
            } label: {
                Text("Find a Mechanic")
                    .frame(width: 250, height: 75)
                    .background(.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.black)
            }
            
            Button {
                ShoppingCartView()
            } label: {
                Text("My Shopping Cart")
                    .frame(width: 250, height: 75)
                    .background(.blue)
                    .clipShape(Capsule())
                    .foregroundColor(.black)
            }
        }
    }
}
