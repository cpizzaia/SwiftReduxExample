//
//  ViewControllerContentView.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation
import UIKit
import SnapKit

class ViewControllerContentView: UIView {
  // MARK: Private Properties
  private let button = UpdateNameButton()
  private let reactiveView = ReactiveView()

  // MARK: Public Methods
  init() {
    super.init(frame: .zero)

    setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private Methods
  private func setupViews() {
    backgroundColor = .white

    setupReactiveView()
    setupButton()
  }

  private func setupReactiveView() {
    addSubview(reactiveView)

    reactiveView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }

  private func setupButton() {
    addSubview(button)

    button.snp.makeConstraints { make in
      make.top.equalTo(reactiveView.snp.bottom).offset(50)
      make.centerX.equalToSuperview()
    }
  }
}
