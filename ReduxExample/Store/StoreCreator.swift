//
//  StoreCreator.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

struct StoreCreator {
  // MARK: Private Properties
  private let rootReducer: Reducer<ReduxStore.State> = { state, action in
    return .init(
      user: UserReducer.reducer(state?.user, action)
    )
  }

  // MARK: Public methods
  func create() -> ReduxStore {
    return .init(rootReducer: rootReducer)
  }
}

let store = StoreCreator().create()
