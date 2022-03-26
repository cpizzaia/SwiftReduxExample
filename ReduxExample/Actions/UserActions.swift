//
//  UserActions.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import Foundation


enum UserActions {
  struct UpdateFirstName: Action {
    let name: String
  }

  struct UpdateLastName: Action {
    let name: String
  }
}
