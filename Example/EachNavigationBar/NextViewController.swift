//
//  NextViewController.swift
//  UIViewController+NavigationBar
//
//  Created by GorXion on 2018/3/26.
//  Copyright © 2018年 gaoX. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        scrollView.delegate = self
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        return scrollView
    }()
    
    private lazy var tipLabel: UILabel = {
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
        lable.center = view.center
        lable.textAlignment = .center
        lable.text = "上下滑动试试"
        return lable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        view.addSubview(tipLabel)
        
        navigation.item.title = "Next"
        navigation.bar.setBackgroundImage(#imageLiteral(resourceName: "nav"), for: .default)
        navigation.item.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backBarButtonAction))
        navigation.item.leftBarButtonItem?.tintColor = UIColor.red
        
        let titleView = UITextField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 100, height: 30))
        titleView.backgroundColor = UIColor.lightGray
        titleView.layer.cornerRadius = 15
        titleView.layer.masksToBounds = true
        navigation.item.titleView = titleView
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func backBarButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension NextViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alpha = 1 - (scrollView.contentOffset.y) / (scrollView.contentSize.height - view.bounds.height)
        navigation.bar.alpha = alpha
    }
}
