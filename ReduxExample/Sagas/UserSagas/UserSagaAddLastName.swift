//
//  AddLastNameSaga.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

enum UserSagaAddLastName {
  static let saga: Saga = { action, state, dispatch in
    SagaFunction.takeEvery(
      targetActionType: UserActions.UpdateFirstName.self,
      actionRan: action,
      state: state,
      dispatch: dispatch,
      saga: updateLastName
    )
  }

  // MARK: Private Static Methods
  private static let updateLastName: Saga = { action, state, dispatch in
    dispatch(UserActions.UpdateLastName(name: "Pizzaia"))
  }
}
