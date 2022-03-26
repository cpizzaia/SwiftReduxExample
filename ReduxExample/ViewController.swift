//
//  ViewController.swift
//  ReduxExample
//
//  Created by Cody Pizzaia on 3/26/22.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let contentView = ViewControllerContentView()

    view.addSubview(contentView)

    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}

