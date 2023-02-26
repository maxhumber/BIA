import SwiftUI

struct OvercastWireframeView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square")
                VStack {
                    Text("Foo")
                    Text("Bar")
                }
                Image(systemName: "square")
            }
            Rectangle()
            VStack {
                Divider()
                HStack {
                    Text("0:00")
                    Spacer()
                    Text("-1:00")
                }
            }
            HStack {
                Image(systemName: "square")
                Image(systemName: "square")
                Image(systemName: "square")
            }
            HStack {
                Image(systemName: "slider.horizontal.3")
                Image(systemName: "alarm")
                Image(systemName: "airplayaudio")
                Image(systemName: "star")
                Image(systemName: "info.circle")
            }
        }
    }
}

struct OvercastWireframeView_Previews: PreviewProvider {
    static var previews: some View {
        OvercastWireframeView()
    }
}
