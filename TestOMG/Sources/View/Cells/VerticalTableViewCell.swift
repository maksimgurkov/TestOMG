import UIKit

// MARK: - VerticalTableViewCell
final class VerticalTableViewCell: UITableViewCell {
    
    static let id = "VerticalTableViewCell"
    
    // MARK: - Private properties
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(title: Int) {
        self.title.text = "\(title)"
    }
}

// MARK: - SetupView
private extension VerticalTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension VerticalTableViewCell {
    func addSubView() {
        contentView.addSubview(title)
    }
}

// MARK: - Layout
private extension VerticalTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
        ])
    }
}
