import SwiftUI

// 40..<45
struct ComponentsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Slider(value: .constant(0.7))
            // Stepper
            // Picker
            // DatePicker
            // Menu
            // Button
        }
        .padding()
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}
