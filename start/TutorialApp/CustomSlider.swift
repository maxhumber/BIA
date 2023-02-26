// ChatGPT: "custom swiftui slider
import SwiftUI

// 45..<60
struct CustomSlider: View {
    @State var value = 0.7
    var trackColor: Color
    var progressColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(trackColor)
                    .frame(height: 8)
                Capsule()
                    .fill(progressColor)
                    .frame(width: CGFloat(value) * geometry.size.width, height: 8)
            }
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value = Double($0.location.x / geometry.size.width) })
                .onEnded({ value = Double($0.location.x / geometry.size.width) })
            )
        }
    }
}

struct CustomSliderView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        @State var value = 0.9
        
        var body: some View {
            VStack {
                Slider(value: $value, in: 0...2)
                    .tint(.red)
                CustomSlider(trackColor: .gray, progressColor: .orange)
                    .foregroundColor(.orange)
            }
            .padding()
        }
    }
}
