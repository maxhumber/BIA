import Foundation

struct Matrix<T> {
    let columns: Int
    let rows: Int
    private var array: [T?]
    
    init(_ columns: Int, _ rows: Int) {
        self.rows = rows
        self.columns = columns
        self.array = Array(repeating: nil, count: rows * columns)
    }
    
    subscript(x: Int, y: Int) -> T? {
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
