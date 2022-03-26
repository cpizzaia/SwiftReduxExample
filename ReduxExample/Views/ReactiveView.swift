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
  private let label = UILabel()

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
    setupLabel()
  }

  private func setupLabel() {
    addSubview(label)

    label.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    label.font = .systemFont(ofSize: 22)
    label.textColor = .black
  }

  // MARK: StoreObserver Methods
  func storeUpdated(fromAction action: Action, newState state: ReduxStore.State) {
    DispatchQueue.main.async {
      self.label.text = UserSelectors.getName(state)
    }
  }
}
