import SwiftUI
struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}
struct ContentView: View {
    @State private var currentLine = Line()
    @State var lines: [Line] = []
    @State var selectedColor: Color = .red
    @State var thickness: Double = 0.0
    var body: some View {
        VStack {
            Canvas {context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({value in let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
                })
                    .onEnded({value in
                        self.currentLine = Line(points:[], color: selectedColor)
                    })
            )
            HStack{
                ColorPickerView(selectedColor: $selectedColor)
                    .onChange(of: selectedColor){ newColor in
                        currentLine.color = newColor
                    }
                Button(action: { lines = [Line]() }) {
                    Text("Delete")
                }.foregroundColor(.red)
            }
        }.frame(minWidth: 400, minHeight: 400)
            .padding()
    }
}
struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
