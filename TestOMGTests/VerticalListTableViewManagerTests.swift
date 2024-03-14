import XCTest
@testable import TestOMG

// MARK: - VerticalTableViewCellTests
final class VerticalListTableViewManagerTests: XCTestCase {
    var sut: VerticalListTableViewManager!

    override func setUp()  {
        super.setUp()
        sut = VerticalListTableViewManager()
    }

    override func tearDown()  {
        sut = nil
        super.tearDown()
    }

    func testUpdateDataAppendNewItems() {
        sut.updateData(indexPath: 0)
        print(sut.viewModel.count)
        XCTAssert(sut.viewModel.count == 100)
    }
}
