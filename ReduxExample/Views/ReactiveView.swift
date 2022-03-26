//
//  ReactiveView.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation
import UIKit

class ReactiveView: UIView, StoreSubscriber {
  // MARK: Private Properties
  private let firstNameLabel = UILabel()
  private let lastNameLabel = UILabel()
  private let labelsContainer = UILabel()

  // MARK: Public Methods
  init(addObserver: AddStoreObserver = store.add(observer:)) {
    super.init(frame: .zero)

    addObserver(self)

    setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private Methods
  private func setupViews() {
    setupLabelsContainer()
    setupFirstNameLabel()
    setupLastNameLabel()
  }

  private func setupLabelsContainer() {
    addSubview(labelsContainer)

    labelsContainer.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

  private func setupFirstNameLabel() {
    labelsContainer.addSubview(firstNameLabel)

    firstNameLabel.snp.makeConstraints { make in
      make.left.top.bottom.equalToSuperview()
    }

    firstNameLabel.font = .systemFont(ofSize: 22)
    firstNameLabel.textColor = .black
  }

  private func setupLastNameLabel() {
    labelsContainer.addSubview(lastNameLabel)

    lastNameLabel.snp.makeConstraints { make in
      make.centerY.right.equalToSuperview()
      make.left.equalTo(firstNameLabel.snp.right)
    }

    lastNameLabel.font = .systemFont(ofSize: 22)
    lastNameLabel.textColor = .black
  }

  // MARK: StoreObserver Methods
  func storeUpdated(fromAction action: Action, newState state: ReduxStore.State) {
    DispatchQueue.main.async {
      self.firstNameLabel.text = UserSelectors.getFirstName(state)
      self.lastNameLabel.text = UserSelectors.getLastName(state)
    }
  }
}
