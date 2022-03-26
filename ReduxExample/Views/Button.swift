//
//  Button.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation
import UIKit

class UpdateNameButton: UIView {
  // MARK: Private Properties
  private let label = UILabel()
  private let dispatch: DispatchAction

  // MARK: Public Methods
  init(dispatch: @escaping DispatchAction = store.dispatch(action:)) {
    self.dispatch = dispatch
    super.init(frame: .zero)

    setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func tapped() {
    dispatch(UserActions.UpdateFirstName(name: "Cody"))
  }

  // MARK: Private Properties
  private func setupViews() {
    backgroundColor = .green
    setupLabel()

    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
  }

  private func setupLabel() {
    addSubview(label)

    label.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.bottom.equalToSuperview().inset(10)
      make.left.equalToSuperview().offset(10)
      make.right.equalToSuperview().inset(10)
    }

    label.font = .systemFont(ofSize: 22)
    label.textColor = .black
    label.text = "Update Name"
  }
}
