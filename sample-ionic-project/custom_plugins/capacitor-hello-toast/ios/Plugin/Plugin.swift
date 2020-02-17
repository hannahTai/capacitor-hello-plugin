import Foundation
import Capacitor

/**
 * The following code is from 
 * https://github.com/ionic-team/capacitor/blob/master/ios/Capacitor/Capacitor/Plugins/Toast.swift.
 */
@objc(HelloToastPlugin)
public class HelloToastPlugin: CAPPlugin {
    
    var toast: UILabel?
    
    @objc func showToast(_ call: CAPPluginCall) {
        // 取得資料
        let data = call.getString("data") ?? ""
        let msg = data + " went through ios objc."
        print("Say hi form ios! " + msg)
      
      // 做點native的事
      DispatchQueue.main.async {
        
        // 取得顯示控制
        let vc = self.bridge!.viewController
        
        // 建立 toast 樣式
        let lb = UILabel()
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.text = msg
        lb.alpha = 0
        lb.layer.cornerRadius = 18
        lb.clipsToBounds  =  true
        lb.lineBreakMode = .byWordWrapping
        lb.numberOfLines = 0
        
        // 建立 toast 大小、位置、邊距
        let maxSizeTitle : CGSize = CGSize(width: vc.view.bounds.size.width-32, height: vc.view.bounds.size.height)
        var expectedSizeTitle : CGSize = lb.sizeThatFits(maxSizeTitle)
        let minWidth = min(maxSizeTitle.width, expectedSizeTitle.width)
        let minHeight = min(maxSizeTitle.height, expectedSizeTitle.height)
        expectedSizeTitle = CGSize(width: minWidth, height: minHeight)
        let height = expectedSizeTitle.height+32
        let y = vc.view.bounds.size.height - height - (height/2)
        lb.frame = CGRect(
          x: ((vc.view.bounds.size.width)/2) - ((expectedSizeTitle.width+32)/2),
          y: y,
          width: expectedSizeTitle.width+32,
          height: height)
        lb.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        // 指派 toast 給全域變數
        self.toast = lb
        
        // 增加到顯示控制裡
        vc.view.addSubview(lb)
        
        // 顯示及淡出的動畫
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
          self.toast!.alpha = 1.0
        }, completion: {(isCompleted) in

          UIView.animate(withDuration: 0.3, delay: 3, options: .curveEaseOut, animations: {
            self.toast!.alpha = 0.0
          }, completion: {(isCompleted) in
            self.toast!.removeFromSuperview()

            // 回傳資料
            let returnValue = ["msg": msg]

            // 成功
            call.success(returnValue)
            // 失敗
            // call.reject("...")
            // 結束
            // call.resolve()
          })
        })
        
      }
    }
}
