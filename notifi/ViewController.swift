//
//  ViewController.swift
//  notifi
//
//  Created by ggwang on 2022/01/02.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var createPopUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var myWebView: WKWebView!
    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        let alertPopUpVC = storyboard.instantiateViewController(identifier: "AlertPopUpVC") as AlertPopUpViewController
        alertPopUpVC.modalPresentationStyle = .overCurrentContext
        alertPopUpVC.modalTransitionStyle = .crossDissolve
    
        alertPopUpVC.subscribeBtnClickedCompletionClosure = {
            print("컴플레션 블럭이 호출 되었다.")
            
            let scannedUrl = URL(string: "https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxjA?view_as=subscriber")
            self.myWebView.load(URLRequest(url: scannedUrl!))
               
        }
    
        self.present(alertPopUpVC, animated: true, completion: nil)
    }
    
    
}

