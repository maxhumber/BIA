import SwiftUI

// Refactored!
struct GameView: View {
    @State var game = Game()
    
    var body: some View {
        VStack {
            winMessage
            GameBoard(game: $game)
            resetButton
        }
    }
    
    var winMessage: some View {
        Text("You win!")
            .opacity(game.playerDidWin ? 1 : 0)
    }
    
    var resetButton: some View {
        Button {
            reset()
        } label: {
            Text("Reset")
        }
    }
    
    private func reset() {
        game = Game()
    }
}

struct GameBoard: View {
    @Binding var game: Game
    
    private var columns: [Int] {
        Array(0..<game.board.columns)
    }
    
    private var rows: [Int] {
        Array(0..<game.board.rows).reversed()
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(columns, id: \.self) { x in
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { y in
                        cell(x, y)
                    }
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    func cell(_ x: Int, _ y: Int) -> some View {
        cellColor(x, y)
            .padding(2)
            .onTapGesture { game.processMove(x, y) }
    }
    
    func cellColor(_ x: Int, _ y: Int) -> Color {
        switch game.board[x, y] {
        case .player: return .orange
        case .goal: return .red
        default: return .gray.opacity(0.1)
        }
    }
}

struct Game {
    var board: Matrix<Square>
    
    init() {
        board = Matrix<Square>(8, 8)
        board[0, 0] = .player
        board[7, 7] = .goal
    }
    
    var playerDidWin: Bool {
        for y in 0..<board.rows {
            for x in 0..<board.columns {
                if board[x, y] == .goal {
                    return false
                }
            }
        }
        return true
    }
    
    mutating func processMove(_ x: Int, _ y: Int) {
        guard let (px, py) = index(.player) else { return }
        let adjacentCoordinates = adjacent(px, py)
        let isAdjacent = adjacentCoordinates.contains { $0 == (x, y) }
        if !isAdjacent { return }
        board[px, py] = nil
        board[x, y] = .player
    }
    
    private func index(_ square: Square) -> (Int, Int)? {
        for y in 0..<board.rows {
            for x in 0..<board.columns {
                if board[x, y] == square {
                    return (x, y)
                }
            }
        }
        return nil
    }
    
    private func adjacent(_ x: Int, _ y: Int) -> [(Int, Int)] {
        let possible = [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]
        let actual = possible.filter { board.valid($0, $1) }
        return actual
    }
}

struct DumbGame4view_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
