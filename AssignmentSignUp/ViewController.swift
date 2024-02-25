//
//  ViewController.swift
//  AssignmentLogin
//
//  Created by Jaehui Yu on 2/22/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addVC()
    }

    private func addVC() {
        let nickname = UINavigationController(rootViewController: NicknameViewController())
        nickname.tabBarItem = UITabBarItem(title: "별명", image: UIImage(systemName: "person.text.rectangle.fill"), selectedImage: UIImage(systemName: "person.text.rectangle.fill"))
        
        let phoneNumber = UINavigationController(rootViewController: PhoneNumberViewController())
        phoneNumber.tabBarItem = UITabBarItem(title: "전화번호", image: UIImage(systemName: "phone.fill"), selectedImage: UIImage(systemName: "phone.fill"))
        
        self.viewControllers = [nickname, phoneNumber]
    }

}

