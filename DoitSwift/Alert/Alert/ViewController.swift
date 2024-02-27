//
//  ViewController.swift
//  Alert
//
//  Created by 김겸손 on 2/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn == true {
            //  UIAlertController를 생성 -> UIAlertAction을 생성(특별한 동작을 하지 않을 경우에 handler를 nil로 함)
            // -> 생성된 onAction을 Alert에 추가 -> present 메서드를 실행
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기",
                                                 message: "램프를 끄시겠습니까?",
                                                 preferredStyle: UIAlertController.Style.alert)
            
            let offACtion = UIAlertAction(title: "네", style: UIAlertAction.Style.default,
                                          handler: { ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offACtion)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
        else {
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?",
                                                preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default) {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        }
        
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
}

