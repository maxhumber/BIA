import Foundation

// 65..<75
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
        get { return nil }
        set { _ = newValue }
    }
}

