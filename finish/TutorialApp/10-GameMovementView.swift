import SwiftUI

struct GameMovementView: View {
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
                .opacity(playerDidWin ? 1 : 0)
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
            Button {
                reset()
            } label: {
                Text("Reset")
            }
        }
    }
    
    var playerDidWin: Bool {
        for row in 0..<board.rows {
            for column in 0..<board.columns {
                if board[column, row] == .goal {
                    return false
                }
            }
        }
        return true
    }
    
    func reset() {
        var new = Matrix<Square>(8, 8)
        new[0, 0] = .player
        new[7, 7] = .goal
        board = new
    }
    
    func move(_ x: Int, _ y: Int) {
        guard let (px, py) = coordinates(for: .player) else { return }
        let adjacentCoordinates = adjacent(px, py)
        let isAdjacent = adjacentCoordinates.contains { $0 == (x, y) }
        if !isAdjacent { return }
        board[px, py] = nil
        board[x, y] = .player
    }
    
    func coordinates(for square: Square) -> (Int, Int)? {
        for row in 0..<board.rows {
            for column in 0..<board.columns {
                if board[column, row] == square {
                    return (column, row)
                }
            }
        }
        return nil
    }
    
    func adjacent(_ x: Int, _ y: Int) -> [(Int, Int)] {
        let possible = [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]
        let actual = possible.filter { board.valid($0, $1) }
        return actual
    }
}

struct GameMovementView_Previews: PreviewProvider {
    static var previews: some View {
        GameMovementView()
    }
}
