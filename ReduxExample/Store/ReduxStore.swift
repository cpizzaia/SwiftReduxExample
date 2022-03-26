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
typealias StoreUpdateMiddleware = (Action, ReduxStore.State, DispatchAction) -> Void

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
  private let middleware: [StoreUpdateMiddleware]

  // MARK: Public Methods
  init(rootReducer: @escaping Reducer<State>, middleware: [StoreUpdateMiddleware]) {
    self.rootReducer = rootReducer
    self.middleware = middleware
    currentState = rootReducer(nil, nil)
  }

  func dispatch(action: Action) {
    dispatchQueue.async {
      self.currentState = self.rootReducer(self.currentState, action)

      self.middleware.forEach { middleware in
        middleware(action, self.currentState, self.dispatch(action:))
      }

      self.storeObserver.notifyObservers(
        forAction: action,
        newState: self.currentState
      )
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
