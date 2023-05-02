import SwiftUI
struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}




struct ContentView: View {
    var body: some View {
        VStack {
            
            Canvas { context, size in
             
            }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local))
        }.frame(minWidth: 400, minHeight: 400)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
    
