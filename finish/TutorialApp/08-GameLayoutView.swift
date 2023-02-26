import SwiftUI

struct GameLayoutView: View {
    var board = Matrix<Square>(8, 8)
    
    private var columns: [Int] {
        Array(0..<board.columns)
    }
    
    private var rows: [Int] {
        (0..<board.rows).reversed()
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(columns, id: \.self) { x in
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { y in
                        ZStack {
                            Color.clear
                            Text("\(x)\(y)")
                        }
                    }
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct GameLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        GameLayoutView()
    }
}
