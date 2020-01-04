//  Refactoring Clean Mess by Jon Reid, https://qualitycoding.org/refactoring-clean-mess/
//  Copyright 2018 Quality Coding, Inc. See LICENSE.txt

import UIKit

enum ViewStyle {
    case undetermined
    case normal
    case alternative
}

struct ScreenStrings {
    let field1Placeholder: String
    let field1Hint: String
    let field2Placeholder: String
    let field2Hint: String
}

struct ViewModel {
    let isAlternateStyle: Bool
    let strings: ScreenStrings
}

final class ViewController: UIViewController {
    let textField1 = UITextField()
    let textField2 = UITextField()
    private let viewModel: ViewModel
    private(set) var viewStyle: ViewStyle

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        viewStyle = .undetermined
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if viewModel.isAlternateStyle {
            textField1.placeholder = viewModel.strings.field1Hint
            textField2.placeholder = viewModel.strings.field2Hint
        } else {
            textField1.placeholder = viewModel.strings.field1Placeholder
            textField2.placeholder = viewModel.strings.field2Placeholder
        }

        if viewModel.isAlternateStyle {
            setUpAlternateView()
        } else {
            setUpNormalView()
        }
    }

    private func setUpAlternateView() {
        viewStyle = .alternative
    }

    private func setUpNormalView() {
        viewStyle = .normal
    }
}
