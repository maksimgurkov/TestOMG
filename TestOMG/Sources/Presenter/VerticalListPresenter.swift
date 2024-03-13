import Foundation

// MARK: - VerticalListPresenter
final class VerticalListPresenter {
    weak var view: VerticalListInput?
    
    // MARK: - Private properties
    private let tableManager: VerticalListTableViewProtocol
    
    // MARK: - Initialisers
    init(tableManager: VerticalListTableViewProtocol) {
        self.tableManager = tableManager
    }
}

// MARK: - VerticalListPresenterProtocol
extension VerticalListPresenter: VerticalListPresenterProtocol {
    func viewDidLoad() {
        createViewModel()
    }
}

// MARK: - Private extension
private extension VerticalListPresenter {
    func createViewModel() {
        let items = Array(1...150)
        DispatchQueue.main.async {
            self.tableManager.update(viewModel: items)
        }
    }
}
