import SwiftUI

struct OvercastStyleView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.orange)
                        .font(.title3)
                    VStack {
                        Text("Title 1 dhjffasdjdfkjdshlfkjsdklfjlsdfsdsdlkfjlsdflkds")
                            .lineLimit(1)
                            .font(.subheadline.weight(.semibold))
                        Text("Title 2 flkadsjfkljdsklf".uppercased())
                            .font(.caption.weight(.semibold))
                            .lineLimit(1)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.orange)
                        .font(.title3)
                }
                //                RoundedRectangle(cornerRadius: 10)
                //                    .aspectRatio(1, contentMode: .fit)
                Image("twobears")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(10)
                    .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 2)
                VStack(spacing: 0) {
                    Slider(value: .constant(5), in: 0...10)
                        .tint(.orange)
                    HStack {
                        Text("0:00")
                        Spacer()
                        Text("-1:00")
                    }
                    .foregroundColor(.gray)
                    .font(.caption.weight(.semibold))
                }
                .padding()
                Spacer()
                HStack(spacing: 30) {
                    Spacer()
                    Image(systemName: "gobackward.30")
                    Spacer()
                    Image(systemName: "play.fill")
                    Spacer()
                    Image(systemName: "goforward.15")
                    Spacer()
                }
                .foregroundColor(.orange)
                .font(.largeTitle)
                .padding(.horizontal)
                Spacer()
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .frame(maxWidth: .infinity)
                    Image(systemName: "alarm")
                        .frame(maxWidth: .infinity)
                    Image(systemName: "airplayaudio")
                        .frame(maxWidth: .infinity)
                    Image(systemName: "star")
                        .frame(maxWidth: .infinity)
                    Image(systemName: "info.circle")
                        .frame(maxWidth: .infinity)
                }
                .foregroundColor(.orange)
                .padding()
                .font(.title3.weight(.semibold))
            }
            .padding(.horizontal)
        }
    }
}


struct OvercastStyleView_Previews: PreviewProvider {
    static var previews: some View {
        OvercastStyleView()
    }
}
