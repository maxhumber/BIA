import SwiftUI

struct GameInteractionView: View {
    @State var board: Matrix<Square>
    
    init() {
        var board = Matrix<Square>(8, 8)
        board[0, 0] = .player
        board[7, 7] = .goal
        self._board = State(initialValue: board)
    }
    
    private var columns: [Int] {
        Array(0..<board.columns)
    }
    
    private var rows: [Int] {
        Array(0..<board.rows).reversed()
    }
    
    var body: some View {
        VStack {
            Text("You win!")
            HStack(spacing: 0) {
                ForEach(columns, id: \.self) { x in
                    VStack(spacing: 0) {
                        ForEach(rows, id: \.self) { y in
                            Group {
                                switch board[x, y] {
                                case .player: Color.orange
                                case .goal: Color.red
                                default: Color.gray.opacity(0.1)
                                }
                            }
                            .padding(2)
                            .onTapGesture { move(x, y) }
                        }
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
    
    func move(_ x: Int, _ y: Int) {
        board[x, y] = .player
    }
}

struct GameInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        GameInteractionView()
    }
}
