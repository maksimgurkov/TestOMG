
import XCTest
@testable import TestOMG

// MARK: - VerticalTableViewCellTests
final class VerticalTableViewCellTests: XCTestCase {
    var sut: VerticalTableViewCell!

    override func setUp()  {
        super.setUp()
        sut = VerticalTableViewCell()
    }

    override func tearDown()  {
        sut = nil
        super.tearDown()
    }

    func testFillNotEmptyArray() {
        sut.fill()
        XCTAssert(!sut.horizontalData.isEmpty)
    }
    
    func testCreateTimerNoNil() {
        sut.createTimer()
        XCTAssert(((sut.timer?.isValid) != nil))
    }
    
    func testUpdateRandomNumbers() {
        sut.updateRandomNumbers()
        XCTAssert(sut.horizontalData.isEmpty)
    }
    
    func testCancelTimerNil() {
        sut.cancelTimer()
        XCTAssert(((sut.timer?.isValid) == nil))
    }
    
    func testUpdateTimer() {
        sut.updateTimer()
        XCTAssert(sut.horizontalData.isEmpty)
    }
}
