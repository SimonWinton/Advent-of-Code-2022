@testable import AdventOfCode
import XCTest

final class RockPaperScissorsTests: XCTestCase {

    var sut: RockPaperScissors!
    
    let sampleData = "A Y\nB X\nC Z"
    
    override func setUp() {
        super.setUp()
        sut = RockPaperScissors()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_Play_ReturnsCorrectScore() {
        let score = sut.play(from: sampleData)
        XCTAssertEqual(score, 12)
    }
    
    //10939 wrong - 11876 wrong too high
    func test_Play_RealData_ReturnsCorrectScore() {
        let score = sut.play(from: importValues())
        print(score)
    }
    
    private func importValues() -> String {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "Day2Input", withExtension: "txt") else {
                fatalError()
            }
            return try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        } catch {
            fatalError("Unable to find file")
        }
    }
}
