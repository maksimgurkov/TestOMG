import UIKit

// MARK: - VerticalTableViewCell
final class VerticalTableViewCell: UITableViewCell {
    
    static let id = "VerticalTableViewCell"
    var horizontalData: [Int] = []
    var timer: Timer?
    
    // MARK: - Private properties
    private var items = [ItemCellType]()
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        createTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    func fill() {
        for _ in 1...15 {
            let randomItem = Int.random(in: 1...100)
            self.horizontalData.append(randomItem)
        }
    }
}

// MARK: - SetupView
private extension VerticalTableViewCell {
    func setupView() {
        selectionStyle = .none
        settingCollectionView()
        settingLayout()
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension VerticalTableViewCell {
    func addSubView() {
        contentView.addSubview(collectionView)
    }
    
    func settingCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            HorizonCollectionViewCell.self,
            forCellWithReuseIdentifier: HorizonCollectionViewCell.id
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func settingLayout() {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    // Обновление одной случайной ячейки во всех горизонтальных списках
    func updateRandomNumbers() {
        guard let cell = collectionView.visibleCells.randomElement() else { return }
        guard let index = collectionView.indexPath(for: cell) else { return }
        let randomItem = Int.random(in: 1...100)
        horizontalData[index.item] = randomItem
        collectionView.reloadData()
        }
}

// MARK: - Layout
private extension VerticalTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension VerticalTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        horizontalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let items = horizontalData[indexPath.item]
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HorizonCollectionViewCell.id,
                for: indexPath
            ) as? HorizonCollectionViewCell else { return UICollectionViewCell() }
            cell.fill(item: items)
            return cell
    }
}

// MARK: - UICollectionViewDelegate
extension VerticalTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        cancelTimer()
        UIView.animate(withDuration: 0.5) {
                if let cell = collectionView.cellForItem(at: indexPath) as? HorizonCollectionViewCell {
                    cell.transform = .init(scaleX: 0.8, y: 0.8)
                }
            }
        }
    
        func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
            UIView.animate(withDuration: 0.5) {
                if let cell = collectionView.cellForItem(at: indexPath) as? HorizonCollectionViewCell {
                    cell.transform = .identity
                }
            }
            createTimer()
        }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VerticalTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: collectionView.frame.height - 10,
            height: collectionView.frame.height
        )
    }
}

// MARK: - Timer
extension VerticalTableViewCell {
    func createTimer() {
        if timer == nil {
            let timer = Timer(timeInterval: 1.0,
                              target: self,
                              selector: #selector(updateTimer),
                              userInfo: nil,
                              repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            
            self.timer = timer
        }
    }
    
    func cancelTimer() {
      timer?.invalidate()
      timer = nil
    }
    
    @objc
    func updateTimer() {
        updateRandomNumbers()
    }
}
