//
//  RootSaga.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation

enum RootSaga {
  static let saga: Saga = { action, state, dispatch in
    UserSaga.saga(action, state, dispatch)
  }
}

typealias Saga = StoreUpdateMiddleware

enum SagaFunction {
  static func takeEvery<SpecificAction: Action>(
    targetActionType: SpecificAction.Type,
    actionRan: Action,
    state: ReduxStore.State,
    dispatch: DispatchAction,
    saga: @escaping Saga
  ) -> Void {
    guard targetActionType == type(of: actionRan) else { return }

    saga(actionRan, state, dispatch)
  }
}
