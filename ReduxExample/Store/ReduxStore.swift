//
//  ReduxStore.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

protocol Action {}

typealias Reducer<ReducerState> = (ReducerState?, Action?) -> ReducerState
typealias DispatchAction = (Action) -> Void
typealias AddStoreObserver = (StoreSubscriber) -> Void

class ReduxStore {
  // MARK: Public Types
  struct State {
    let user: UserReducer.State
  }

  // MARK: Private Properties
  private var currentState: State
  private let rootReducer: Reducer<State>
  private let dispatchQueue = DispatchQueue(label: "ReduxStore")
  private let storeObserver = StoreObserver()

  // MARK: Public Methods
  init(rootReducer: @escaping Reducer<State>) {
    self.rootReducer = rootReducer
    currentState = rootReducer(nil, nil)
  }

  func dispatch(action: Action) {
    dispatchQueue.sync {
      currentState = rootReducer(currentState, action)

      storeObserver.notifyObservers(forAction: action, newState: currentState)
    }
  }

  func getState() -> State {
    dispatchQueue.sync {
      currentState
    }
  }

  func add(observer: StoreSubscriber) {
    storeObserver.add(observer: observer)
  }
}
