//  Refactor Small Steps Continued by Jon Reid, https://qualitycoding.org/
//  Copyright 2018 Jonathan M. Reid. See LICENSE.txt

@testable import RefactorSmallStepsContinued
import XCTest

final class ViewControllerTests: XCTestCase {
    private var strings: ScreenStrings!

    override func setUp() {
        super.setUp()
        strings = ScreenStrings(field1Placeholder: "PLACEHOLDER 1", field1Hint: "HINT 1",
                                field2Placeholder: "PLACEHOLDER 2", field2Hint: "HINT 2")
    }

    override func tearDown() {
        strings = nil
        super.tearDown()
    }

    private func makeViewController(isAlternateStyle: Bool) -> ViewController {
        let viewModel = ViewModel(isAlternateStyle: isAlternateStyle, strings: strings)
        return ViewController(viewModel: viewModel)
    }

    func test_loadingView_withNormalStyle_shouldSetTextFieldPlaceholdersToPlaceholderStrings() {
        let sut = makeViewController(isAlternateStyle: false)

        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.textField1.placeholder, "PLACEHOLDER 1")
        XCTAssertEqual(sut.textField2.placeholder, "PLACEHOLDER 2")
    }

    func test_loadingView_withAlternativeStyle_shouldSetTextFieldPlaceholdersToHintStrings() {
        let sut = makeViewController(isAlternateStyle: true)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.textField1.placeholder, "HINT 1")
        XCTAssertEqual(sut.textField2.placeholder, "HINT 2")
    }
    
    func test_loadingView_withNormalStyle_shouldSetUpNormalView() {
        let sut = makeViewController(isAlternateStyle: false)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.viewStyle, .normal)
    }

    func test_loadingView_withAlternativeStyle_shouldSetUpAlternativeView() {
        let sut = makeViewController(isAlternateStyle: true)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.viewStyle, .alternative)
    }
}
