import SwiftUI

// 10..<35
struct OvercastView: View {
    var body: some View {
        VStack {
            Image("overcast")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct OvercastView_Previews: PreviewProvider {
    static var previews: some View {
        OvercastView()
    }
}
