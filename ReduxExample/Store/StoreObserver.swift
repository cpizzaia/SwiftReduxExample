//
//  StoreObserver.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

protocol StoreSubscriber {
  func storeUpdated(fromAction action: Action, newState state: ReduxStore.State)
}

class StoreObserver {
  // MARK: Private Properties
  private var observers: [StoreSubscriber] = []
  private let dispatchQueue = DispatchQueue(label: "StoreObserver")

  // MARK: Public Properties
  func add(observer: StoreSubscriber) {
    dispatchQueue.sync {
      observers.append(observer)
    }
  }

  func notifyObservers(forAction action: Action, newState state: ReduxStore.State) {
    dispatchQueue.sync {
      observers.forEach { observer in
        observer.storeUpdated(fromAction: action, newState: state)
      }
    }
  }
}
