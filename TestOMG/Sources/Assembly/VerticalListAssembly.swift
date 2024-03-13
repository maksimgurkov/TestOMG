import UIKit

// MARK: - VerticalListAssembly
final class VerticalListAssembly {
    static func assemble() -> UIViewController {
        let tableManager = VerticalListTableViewManager()
        let presenter = VerticalListPresenter(tableManager: tableManager)
        let view = VerticalListViewController(presenter: presenter)
        
        presenter.view = view
        tableManager.setup(tableView: view.tableView)
        return view
    }
}
