//
//  UserReducer.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

enum UserReducer {
  // MARK: Public Types
  struct State {
    let name: String?
  }

  // MARK: Private Static Properties
  private static let defaultState: State = .init(name: nil)

  // MARK: Public Static Methods
  static let reducer: Reducer<State> = { state, action in
    switch action {
    case let action as UserActions.UpdateName:
      return .init(name: action.name)
    default:
      return state ?? defaultState
    }
  }
}

enum UserSelectors {
  // MARK: Public Static Methods
  static func getName(_ state: ReduxStore.State) -> String? {
    return state.user.name
  }
}
