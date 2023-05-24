import SwiftUI

struct ContentView: View {
    
    @State var logoRotate:Int = 0
    @State var isAnimated:Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Button (action: {
                    withAnimation(.default) {
                        isAnimated.toggle()
                        if isAnimated == true {
                            logoRotate += 360
                        } else {
                            logoRotate -= 360
                        }
                    }
                }, label: {
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
                }
                )
                .rotation3DEffect(.degrees(Double(logoRotate)), axis: (x: 0.0, y: 0.0, z: 1.0))
                
                
                
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
                
                
                NavigationLink {
                    SettingsView()
                } label: {
                    Text("Settings")
                        .font(.title2)
                        .frame(width: 300, height: 75)
                        .background(.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.black)
                        .padding(20)
                }
               
            }
        }
        .navigationViewStyle(.stack)
    }
}
