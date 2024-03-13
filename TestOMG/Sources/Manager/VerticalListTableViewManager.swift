import UIKit

// MARK: - VerticalListTableViewManager
final class VerticalListTableViewManager: NSObject {
    weak var tableView: UITableView?
    
    // MARK: - Private proprties
    private var viewModel = [Int]()
}

// MARK: - VerticalListTableViewManager
extension VerticalListTableViewManager: VerticalListTableViewProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(VerticalTableViewCell.self, forCellReuseIdentifier: VerticalTableViewCell.id)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
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
        cell.fill(title: viewModel[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension VerticalListTableViewManager: UITableViewDelegate {
    
}
