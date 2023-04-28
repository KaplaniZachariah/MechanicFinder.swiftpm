import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 250, height: 250)
                        .foregroundColor(.blue)
                        .padding(20)
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
                
                NavigationLink { 
                    MechanicSearchView()
                } label: { 
                    Text("Find a Mechanic")
                        .font(.title2)
                        .frame(width: 300, height: 75)
                        .background(.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.black)
                        .padding(20)
                }

                
                NavigationLink { 
                    ToolNavigatorView()
                } label: { 
                    Text("Shop for Tools")
                        .font(.title2)
                        .frame(width: 300, height: 75)
                        .background(.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.black)
                        .padding(20)
                }
            }
        }
    }
}
