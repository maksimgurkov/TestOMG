import UIKit

fileprivate let separatorIndent: CGFloat = 16
fileprivate let heighCell: CGFloat = 110

// MARK: - VerticalListTableViewManager
final class VerticalListTableViewManager: NSObject {
    weak var tableView: UITableView?
    
    // MARK: - Private properties
    private var viewModel = [Int]()
}

// MARK: - VerticalListTableViewManager
extension VerticalListTableViewManager: VerticalListTableViewProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            VerticalTableViewCell.self,
            forCellReuseIdentifier: VerticalTableViewCell.id
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorInset = UIEdgeInsets(
            top: 0,
            left: separatorIndent,
            bottom: 0,
            right: separatorIndent
        )
    }
    
    func update(viewModel: [Int]) {
        self.viewModel = viewModel
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension VerticalListTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: VerticalTableViewCell.id,
            for: indexPath
        ) as? VerticalTableViewCell else { return UITableViewCell() }
        cell.fill()
        return cell
    }
}

// MARK: - UITableViewDelegate
extension VerticalListTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heighCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.count - 1 {
            viewModel += Array(1...100)
            tableView.reloadData()
        }
    }
}
