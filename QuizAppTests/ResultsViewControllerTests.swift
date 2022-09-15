//
//  ResultsViewControllerTests.swift
//  QuizAppTests
//
//  Created by Dmitrii Voronin on 15.09.2022.
//
import Foundation
import XCTest
@testable import QuizApp

class ResultsViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_renderSummary() {

        XCTAssertEqual(makeSUT(summary: "a summary").headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_rendersAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: [makeDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }

    func test_viewDidLoad_withCorrectAnswer_renderCorrectAnswerCall() {
        let sut = makeSUT(answers: [PresentableAnswer(isCorrect: true)])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell

        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_withWrongAnswer_renderWrongAnswerCall() {
        let sut = makeSUT(answers: [PresentableAnswer(isCorrect: false)])

        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell

        XCTAssertNotNil(cell)
    }
    
    //MARK: Helpers
    
    private func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    private func makeDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: false)
    }
}
 
