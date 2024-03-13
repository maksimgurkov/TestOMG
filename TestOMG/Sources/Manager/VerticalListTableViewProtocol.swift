import UIKit

// MARK: - VerticalListTableViewProtocol
protocol VerticalListTableViewProtocol {
    func setup(tableView: UITableView)
    func update(viewModel: [Int])
}
