//
//  CustomPopUpViewController.swift
//  notifi
//
//  Created by ggwang on 2022/01/02.
//


import UIKit

class AlertPopUpViewController: UIViewController {
    //aa
        @IBOutlet weak var blogBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    @IBOutlet weak var openChaBtn: UIButton!
    var subscribeBtnClickedCompletionClosure: (() -> Void)?
    var myPopUpDelegate : PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CustomPopUpViewController - viewDidLoad() called")
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChaBtn.layer.cornerRadius = 10
        blogBtn.layer.cornerRadius = 10
        
        
    }
    
    
   //MARK - IBAction
    
    @IBAction func onBgViewClicked(_ sender: Any) {
        print("AlertPopUpViewController - onBgViewClicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
    
        print("AlertPopUpViewController - onSubscribeBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribeBtnClickedCompletionClosure = subscribeBtnClickedCompletionClosure {
            subscribeBtnClickedCompletionClosure()
        }
        }
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        //이게 지금 리모컨을 14번 채널로 간걸로 생각하면 됩니다. 이벤트를 발동하게 된다. 
       
        myPopUpDelegate?.onOpenChatBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
    //여기서 노티피케이션 방송을 시작한다
    
    @IBAction func onBlogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBlogBtnClicked()")
        
        //post 이벤트를 알린다. 여러가지가 있다 데이터도 넘길수가 있다.
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
}
