import Foundation

// MARK: - ItemCellType
enum ItemCellType {
    case item(ItemViewModel)
}

// MARK: - ItemViewModel
struct ItemViewModel {
    var item: Int
    
    mutating func updateItem() {
        item += 1
    }
}

