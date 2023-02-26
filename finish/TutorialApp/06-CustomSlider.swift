import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    var bounds: ClosedRange<Double>
    private var barHeight: Double = 3
    private var circleDiameter: Double = 12
    
    init(value: Binding<Double>, in bounds: ClosedRange<Double> = 0...1) {
        self._value = value
        self.bounds = bounds
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: barHeight)
                    Rectangle()
                        .frame(width: percent(value) * geometry.size.width, height: barHeight)
                }
                .clipShape(RoundedRectangle(cornerRadius: barHeight))
                Circle()
                    .fill(.white)
                    .frame(height: circleDiameter + barHeight)
                    .offset(x: percent(value) * geometry.size.width - (circleDiameter + barHeight)/2)
                Circle()
                    .frame(height: circleDiameter)
                    .offset(x: percent(value) * geometry.size.width - circleDiameter/2)
                    .gesture(
                        DragGesture()
                            .onEnded { value = clamp(value($0.location.x / geometry.size.width)) }
                            .onChanged { value = clamp(value($0.location.x / geometry.size.width)) }
                    )

            }
        }
    }
    
    func percent(_ value: Double) -> Double {
        (value - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound)
    }
    
    func value(_ percent: Double) -> Double {
        (percent * (bounds.upperBound - bounds.lowerBound)) + bounds.lowerBound
    }
    
    func clamp(_ value: Double) -> Double {
        min(max(value, bounds.lowerBound), bounds.upperBound)
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
                CustomSlider(value: $value, in: 0...2)
                    .foregroundColor(.orange)
            }
            .padding()
        }
    }
}
