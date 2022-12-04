@testable import AdventOfCode
import XCTest

final class RockPaperScissorsTests: XCTestCase {

    var sut: RockPaperScissors!
    
    override func setUp() {
        super.setUp()
        sut = RockPaperScissors()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Play_ReturnsCorrectScore() {
        let score = sut.play()
        XCTAssertEqual(score, 15)
    }
    
    
}
