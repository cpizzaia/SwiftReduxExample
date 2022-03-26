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
    let firstName: String?
    let lastName: String?
  }

  // MARK: Private Static Properties
  private static let defaultState: State = .init(firstName: nil, lastName: nil)

  // MARK: Public Static Methods
  static let reducer: Reducer<State> = { state, action in
    switch action {
    case let action as UserActions.UpdateFirstName:
      return .init(firstName: action.name, lastName: state?.lastName)
    case let action as UserActions.UpdateLastName:
      return .init(firstName: state?.firstName, lastName: action.name)
    default:
      return state ?? defaultState
    }
  }
}

enum UserSelectors {
  // MARK: Public Static Methods
  static func getFirstName(_ state: ReduxStore.State) -> String? {
    return state.user.firstName
  }

  static func getLastName(_ state: ReduxStore.State) -> String? {
    return state.user.lastName
  }
}
