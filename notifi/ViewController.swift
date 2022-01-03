//
//  ViewController.swift
//  notifi
//
//  Created by ggwang on 2022/01/02.
//

import UIKit
import WebKit

//안테나를 단다는 생각을 가지면 된다.
//이게 주파수이다.
let notificationName = "btnClickNotification"//이건 상수이다.

class ViewController: UIViewController, PopUpDelegate {
    
    

    @IBOutlet weak var createPopUpBtn: UIButton!
   //노티피케이션 해제
    //똑같이 실행되지만 지우는 단계도 필요하다 .
    //다른 거를 실행할떄는 옵저버거 해제되서 메모리를 사용하지 않는다. 
    deinit {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //노티피케이션 이라는 방송 수시긴를 장착한다.
         //selector 버튼이 클릭되면 이 메서드가 발동이 된다
        //장착이 되었고 방송르 뿌려야된다 alert class에 가야된다.
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    //이게 방송이 시작하면 이게 나온다
    @objc fileprivate func loadWebView() {
        print("ViewController - loadWebView")
        let myChannel = URL(string: "https://blog.naver.com/kor216465")
        self.myWebView.load(URLRequest(url: myChannel!))
        
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
    //alertpopup delegate 랑 연결해줘야된다.
        alertPopUpVC.myPopUpDelegate = self
        self.present(alertPopUpVC, animated: true, completion: nil)
    }
    
    
    //MARK: - PopUpDelegate
    
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called")
        let myChannel = URL(string: "https://open.kakao.com/o/gxOOKJec")
        self.myWebView.load(URLRequest(url: myChannel!))
    }
    
    
}

