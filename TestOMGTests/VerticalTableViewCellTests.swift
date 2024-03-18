import XCTest
@testable import TestOMG

class VerticalTableViewCellTests: XCTestCase {
    var sut: VerticalTableViewCell!

    override func setUp() {
        super.setUp()
        sut = VerticalTableViewCell(style: .default, reuseIdentifier: VerticalTableViewCell.id)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFill() {
        let expectedItemCount = 15
        sut.fill()
        XCTAssertEqual(sut.horizontalData.count, expectedItemCount)
    }

    func testCollectionViewSetup() {
        let expectedReuseIdentifier = HorizonCollectionViewCell.id
        
        let cell = sut.collectionView.dequeueReusableCell(withReuseIdentifier: expectedReuseIdentifier, for: IndexPath(item: 0, section: 0))

        XCTAssertNotNil(cell)
        XCTAssertTrue(cell is HorizonCollectionViewCell)
    }

    func testCollectionViewDidHighlight() {

        let indexPath = IndexPath(item: 0, section: 0)
        let cell = HorizonCollectionViewCell()
        sut.collectionView.register(HorizonCollectionViewCell.self, forCellWithReuseIdentifier: HorizonCollectionViewCell.id)
        sut.collectionView.addSubview(cell)

        sut.collectionView(sut.collectionView, didHighlightItemAt: indexPath)

        XCTAssert(cell.transform.isIdentity)
    }
    
    func testCollectionViewDidUnhighlight() {

        let indexPath = IndexPath(item: 0, section: 0)
        let cell = HorizonCollectionViewCell()
        sut.collectionView.register(HorizonCollectionViewCell.self, forCellWithReuseIdentifier: HorizonCollectionViewCell.id)
        sut.collectionView.addSubview(cell)

        sut.collectionView(sut.collectionView, didUnhighlightItemAt: indexPath)
        XCTAssertEqual(cell.transform, .identity)
   
    }
    
    func testUpdateTimer() {
        sut.updateTimer()
        XCTAssert(sut.horizontalData.isEmpty)
    }
    
    func testUpdateRandomNumbers() {
        sut.fill()
        let initialItemCount = sut.horizontalData.count
        sut.updateRandomNumbers()
        XCTAssertEqual(sut.horizontalData.count, initialItemCount, "Array count should remain the same")
    }
}
