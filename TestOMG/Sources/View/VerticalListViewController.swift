import UIKit

// MARK: - VerticalListViewController
final class VerticalListViewController: UIViewController {
    
    var timer = Timer()
    
    // MARK: - Private properties
    private let presenter: VerticalListPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialisers
    init(presenter: VerticalListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
}

// MARK: - VerticalListInput
extension VerticalListViewController: VerticalListInput {}

// MARK: - SetupView
private extension VerticalListViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension VerticalListViewController {
    func addSubView() {
        view.addSubview(tableView)
    }
}

// MARK: - Layout
private extension VerticalListViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//extension VerticalListViewController {
//    func startTimer() {
//        timer = Timer.scheduledTimer(
//            timeInterval: 1,
//            target: self,
//            selector: #selector(updateTimer),
//            userInfo: nil,
//            repeats: true
//        )
//    }
//    
//    @objc func updateTimer() {
//        print("1")
//    }
//}
