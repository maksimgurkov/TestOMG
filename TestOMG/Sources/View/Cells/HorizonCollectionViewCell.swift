import UIKit

fileprivate let cornerRadius: CGFloat = 10
fileprivate let borderWidth: CGFloat = 1

// MARK: - HorizonCollectionViewCell
final class HorizonCollectionViewCell: UICollectionViewCell {
    
    static let id = "HorizonCollectionViewCell"
    
    // MARK: - Private properties
    private let itemLabel: UILabel = {
        return UILabel()
    }()
    
    // MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
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
        /*
        Использовал cornerRadius по причине что Apple починили закадровый рендеринг
        и он теперь работает верно. Да я знаю что можно сделать через bezierPath
         */
        layer.cornerRadius = cornerRadius
        layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.borderWidth = borderWidth
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
