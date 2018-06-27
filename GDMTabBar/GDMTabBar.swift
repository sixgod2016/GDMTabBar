//
//  GDMTabBar.swift
//  GDMTabBar
//
//  Created by 222 on 2018/6/26.
//  Copyright © 2018年 222. All rights reserved.
//

import UIKit

protocol GDMTabBarDelegate {
	func buttonClick(tabBar: GDMTabBar)
}

class GDMTabBar: UITabBar {

	var gdmDelegate: GDMTabBarDelegate?
	private var button: UIButton!
	private var buttonLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupUI() {
		button = UIButton(type: .custom)
		let img = UIImage(named: "post_animate_add")
		button.frame = CGRect(x: 0, y: 0, width: (img?.size.width)!, height: (img?.size.height)!)
		button.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: 0)
		button.setBackgroundImage(img, for: .normal)
		
		button.adjustsImageWhenHighlighted = false
		button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
		self.addSubview(button)
	}
	
	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		if self.isHidden {
		} else {
			let tmpPoint = self.button.convert(point, from: self)
			if self.button.bounds.contains(tmpPoint) {
				return self.button
			}
		}
		return super.hitTest(point, with: event)
	}
	
	@objc func buttonClick() {
		print("buttonClick")
		gdmDelegate?.buttonClick(tabBar: self)
	}
	
}
