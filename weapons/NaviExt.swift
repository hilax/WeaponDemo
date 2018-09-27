//
//  NaviExt.swift
//  weapons
//
//  Created by Hilax on 2018/5/25.
//  Copyright © 2018年 Hilax. All rights reserved.
//

import UIKit
extension UINavigationController {
    //子页面的状态栏
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
