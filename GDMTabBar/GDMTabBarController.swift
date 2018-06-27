//
//  GDMTabBarController.swift
//  自定义Tabbar
//
//  Created by 222 on 2018/6/26.
//  Copyright © 2018年 222. All rights reserved.
//

import UIKit

class GDMTabBarController: UITabBarController, GDMTabBarDelegate {

	var gdmTabBar: GDMTabBar!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = AAViewController()
		self.setTabBar(controller: a, naviTitle: "A", barTitle: "AA", imgName: "account_normal", selectImgName: "account_highlight")
		let b = BBViewController()
		self.setTabBar(controller: b, naviTitle: "B", barTitle: "BB", imgName: "", selectImgName: "")
		gdmTabBar = GDMTabBar()
		gdmTabBar.gdmDelegate = self
		self.setValue(gdmTabBar, forKey: "tabBar")
		
		let c = CCViewController()
		self.setTabBar(controller: c, naviTitle: "C", barTitle: "CC", imgName: "home_normal", selectImgName: "home_highlight")
    }
	
	func setTabBar(controller: UIViewController, naviTitle: String, barTitle: String, imgName: String, selectImgName: String) {
		let navi = UINavigationController(rootViewController: controller)
		controller.title = barTitle
		controller.navigationItem.title = naviTitle
		controller.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal)
		controller.tabBarItem.selectedImage = UIImage(named: selectImgName)?.withRenderingMode(.alwaysOriginal)
		self.addChildViewController(navi)
	}
	
	func buttonClick(tabBar: GDMTabBar) {
		self.selectedIndex = 1
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
