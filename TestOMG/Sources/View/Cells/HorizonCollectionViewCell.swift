import UIKit

// MARK: - HorizonCollectionViewCell
final class HorizonCollectionViewCell: UICollectionViewCell {
    
    static let id = "HorizonCollectionViewCell"
    
    private var itemLabel: UILabel = UILabel() {
        didSet {
            itemLabel.text = "100"
        }
    }
    
    // MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(item: Int) {
        itemLabel.text = "\(item)"
    }
}

// MARK: - SetupView
private extension HorizonCollectionViewCell {
    func setupView() {
        backgroundColor = .orange
        layer.cornerRadius = 10
        layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.borderWidth = 1
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension HorizonCollectionViewCell {
    func addSubView() {
        contentView.addSubview(itemLabel)
    }
}

// MARK: - Layout
private extension HorizonCollectionViewCell {
    func setConstraints() {
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
