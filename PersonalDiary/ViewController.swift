//
//  ViewController.swift
//  PersonalDiary
//
//  Created by Artem Serebriakov on 23.08.2022.
//

import UIKit
import LocalAuthentication
import mshmelly2022

class ViewController: UIViewController {
    private let context = LAContext()
    private var error: NSError?
    
    private lazy var loginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
        
    @objc func loginAction() {
        auth()
        print(#function)
    }
    
    private func auth() {
        let reason = NSLocalizedString("Тебе нужно авторизоваться", comment: "reason for auth")
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if !success || error != nil {
                    print(error?.localizedDescription)
                } else {
      

                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        auth()
        setupUI()
        setConstrains()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        view.addSubview(loginButton)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}

extension ViewController {
    func showAlert(title: String, message: String, firstAction: String, secondAction: String?) {
           // create the alert
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

          // add the actions (buttons)
           alert.addAction(UIAlertAction(title: firstAction, style: UIAlertAction.Style.default, handler: nil))
           if let secondAction = secondAction {
               alert.addAction(UIAlertAction(title: secondAction, style: UIAlertAction.Style.cancel, handler: nil))
           }
          // show the alert
          self.present(alert, animated: true, completion: nil)
    }
}

