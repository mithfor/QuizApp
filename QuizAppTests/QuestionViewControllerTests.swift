//
//  QuestionViewControllerTests.swift
//  QuizAppTests
//
//  Created by Dmitrii Voronin on 16.08.2022.
//

import Foundation
import XCTest
@testable import QuizApp

class QuestionViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_renderQuestionHeaderText() {
        
        let sut = makeSut(question: "Q1")
        
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        let sut = makeSut()
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneOption_rendersOneOption() {
        let sut = makeSut(options: ["A1"])
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: .zero), 1)
    }
    
    func test_viewDidLoad_withOneOption_rendersOneOptionText() {
        let sut = makeSut(options: ["A1"])
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
    
    func makeSut(question: String = "", options: [String] = []) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options)
        _ = sut.view
        return sut
    }
}
