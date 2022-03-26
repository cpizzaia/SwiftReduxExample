//
//  UserSaga.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

enum UserSaga {
  // MARK: Public Static Methods
  static let saga: Saga = { action, state, dispatch in
    UserSagaAddLastName.saga(action, state, dispatch)
  }
}
