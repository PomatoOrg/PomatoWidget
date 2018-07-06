//
//  TodayViewController.swift
//  PomatoWidget
//
//  Created by Jerry on 2018/7/6.
//  Copyright © 2018年 Pomato. All rights reserved.
//

import UIKit
import NotificationCenter
import SnapKit
class TodayViewController: UIViewController, NCWidgetProviding {
    lazy var button: UIButton = {
        
        let btn=UIButton(type: .custom);
        btn.setTitle("进入到Pomato", for: .normal)
    
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(click(btn:)), for: .touchUpInside)
        return btn
    }()
    
    @objc public func click(btn:UIButton) -> Void {
        self.extensionContext?.open(URL(string: "pomato.mainapp://")!, completionHandler: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        //    self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        self.button.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.view)
            make.center.equalToSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        self.preferredContentSize = (activeDisplayMode == .compact) ? maxSize : CGSize(width: maxSize.width, height: 200)
    }
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
