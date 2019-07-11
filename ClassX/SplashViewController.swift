//
//  SplashViewController.swift
//  ClassX
//
//  Created by stu-38 on 2019/7/11.
//  Copyright © 2019 stu-38. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController ,AsyncReponseDelegate {

    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
//        print(responseString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let worker : AsyncRequestWorker = AsyncRequestWorker()
        worker.reponseDelegate = self
        
        worker.getResponse(from: "https://google.com", tag: 1)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name(rawValue: "response.received"), object: nil)
    }
    

    @objc func keyboardWillShow(notification: NSNotification) {
        
        let word = notification.userInfo!["response"]
        
        print(word)
    }

}
