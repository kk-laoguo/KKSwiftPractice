//
//  BaseViewController.swift
//  U17Demo
//
//  Created by zainguo on 2020/7/19.
//  Copyright © 2020 zainguo. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        setupLayout()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    func setupLayout() { }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    func configNavigationBar() {
          guard let nav = navigationController else { return }
          if nav.visibleViewController == self {
              nav.barStyle(.theme)
              nav.disablePopGesture = false
              nav.setNavigationBarHidden(false, animated: true)
              
              if nav.viewControllers.count > 1 {
                  navigationItem.leftBarButtonItem = UIBarButtonItem(
                      image: UIImage(named: "backGreen"),
                      style: .plain,
                      target: self,
                      action: #selector(pressBack))
              }
          }
      }
      @objc func pressBack() {
          navigationController?.popViewController(animated: true)
      }


}


