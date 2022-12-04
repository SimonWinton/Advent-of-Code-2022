@testable import AdventOfCode
import XCTest

final class RPSPlayableItemTests: XCTestCase {

    func test_RPSPlayableItem_CreateItem_InvalidValue_returnsNil() {
        let item = RPSPlayableItem.createItem(from: "invalid")
        XCTAssertNil(item)
    }
    
    func test_RPSPlayableItem_CreateItem_X_returnsRock() {
        let item = RPSPlayableItem.createItem(from: "X")
        XCTAssertEqual(item, .rock)
    }
    
    func test_RPSPlayableItem_CreateItem_A_returnsRock() {
        let item = RPSPlayableItem.createItem(from: "A")
        XCTAssertEqual(item, .rock)
    }
    
    func test_RPSPlayableItem_CreateItem_Y_returnsPaper() {
        let item = RPSPlayableItem.createItem(from: "Y")
        XCTAssertEqual(item, .paper)
    }
    
    func test_RPSPlayableItem_CreateItem_B_returnsPaper() {
        let item = RPSPlayableItem.createItem(from: "B")
        XCTAssertEqual(item, .paper)
    }
    
    func test_RPSPlayableItem_CreateItem_Z_returnsScissors() {
        let item = RPSPlayableItem.createItem(from: "Z")
        XCTAssertEqual(item, .scissors)
    }
    
    func test_RPSPlayableItem_CreateItem_C_returnsScissors() {
        let item = RPSPlayableItem.createItem(from: "C")
        XCTAssertEqual(item, .scissors)
    }
    
    func test_RPSPlayableItem_RockCanBeat_Scissors_returnsTrue() {
        let item = RPSPlayableItem.rock
        XCTAssertTrue(item.canBeat(item: .scissors))
    }
    
    func test_RPSPlayableItem_RockCanBeat_Paper_returnsFalse() {
        let item = RPSPlayableItem.rock
        XCTAssertFalse(item.canBeat(item: .paper))
    }
    
    func test_RPSPlayableItem_RockCanBeat_Rock_returnsFalse() {
        let item = RPSPlayableItem.rock
        XCTAssertFalse(item.canBeat(item: .rock))
    }
    
    func test_RPSPlayableItem_PaperCanBeat_Scissors_returnsTrue() {
        let item = RPSPlayableItem.paper
        XCTAssertFalse(item.canBeat(item: .scissors))
    }
    
    func test_RPSPlayableItem_PaperCanBeat_Paper_returnsFalse() {
        let item = RPSPlayableItem.paper
        XCTAssertFalse(item.canBeat(item: .paper))
    }
    
    func test_RPSPlayableItem_PaperCanBeat_Rock_returnsTrue() {
        let item = RPSPlayableItem.paper
        XCTAssertTrue(item.canBeat(item: .rock))
    }
    
    func test_RPSPlayableItem_ScissorsCanBeat_Scissors_returnsTrue() {
        let item = RPSPlayableItem.scissors
        XCTAssertFalse(item.canBeat(item: .scissors))
    }
    
    func test_RPSPlayableItem_ScissorsCanBeat_Paper_returnsTrue() {
        let item = RPSPlayableItem.scissors
        XCTAssertTrue(item.canBeat(item: .paper))
    }
    
    func test_RPSPlayableItem_ScissorsCanBeat_Rock_returnsFalse() {
        let item = RPSPlayableItem.scissors
        XCTAssertFalse(item.canBeat(item: .rock))
    }

}
