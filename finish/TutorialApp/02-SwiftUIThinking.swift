import SwiftUI

struct SwiftUIThinkingView: View {
    var body: some View {
        // "Enable Layers"
        ZStack {
            // Set "Background Layer"
            Color(uiColor: .blue)
            // Create "Foreground Layer"
            VStack {
                Spacer()
                ZStack {
                    // Add Rectangle
                    Rectangle()
                        .fill(.white)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 100)
                    // Layer... again
                    Text("SwiftUI")
                }
                Spacer()
            }
        }
    }
}

struct SwiftUIThinkingView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIThinkingView()
    }
}
