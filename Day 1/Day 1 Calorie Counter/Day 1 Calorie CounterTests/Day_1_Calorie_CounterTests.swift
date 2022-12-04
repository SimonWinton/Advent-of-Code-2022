//
//  Day_1_Calorie_CounterTests.swift
//  Day 1 Calorie CounterTests
//
//  Created by Simon Winton on 04/12/2022.
//

import XCTest
@testable import Day_1_Calorie_Counter

final class Day_1_Calorie_CounterTests: XCTestCase {

    var sut: CalorieCounter!
    
    let sampleData = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000"
    
    override func setUp() {
        super.setUp()
        sut = CalorieCounter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_GetMostCalories_sampleData_ReturnsHighestValueAt24000() {
        let highestCalorieCount = sut.getMostCalories(from: sampleData)
        XCTAssertEqual(highestCalorieCount, 24000)
    }
    
    func test_GetMostCalories_sampleData_ReturnsHighestValueFromData() {
        let highestCalorieCount = sut.getMostCalories(from: importValues())
        print(highestCalorieCount)
    }
    
    private func importValues() -> String {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else {
                fatalError()
            }
            return try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        } catch {
            fatalError("Unable to find file")
        }
    }

}
