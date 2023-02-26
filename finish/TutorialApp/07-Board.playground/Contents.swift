import Foundation

enum Square: String {
    case goal = "X"
    case player = "O"
}

struct Matrix {
    let columns: Int
    let rows: Int
    private var array: [Square?]
    
    init(_ columns: Int, _ rows: Int) {
        self.rows = rows
        self.columns = columns
        self.array = Array(repeating: nil, count: rows * columns)
    }
    
    subscript(x: Int, y: Int) -> Square? {
        get {
            assert(valid(x, y), "Index out of range")
            return array[(y * columns) + x]
        }
        set {
            assert(valid(x, y), "Index out of range")
            array[(y * columns) + x] = newValue
        }
    }
    
    func valid(_ column: Int, _ row: Int) -> Bool {
        column >= 0 &&
        column < columns &&
        row >= 0 &&
        row < rows
    }
}

infix operator >--: RangeFormationPrecedence

func >-- <T: Strideable>(maximum: T, minimum: T) -> ReversedCollection<Range<T>> {
    (minimum..<maximum).reversed()
}

extension Matrix: CustomStringConvertible {
    var description: String {
        var string = ""
//        for y in (0..<rows).reversed() {
        for y in rows>--0 {
            for x in 0..<columns {
                string += self[x, y]?.rawValue ?? "."
            }
            string += "\n"
        }
        return string
    }
}

var board = Matrix(8, 8)
board[0, 0] = .player
board[7, 7] = .goal
print(board)

