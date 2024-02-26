//
//  PhoneNumberViewController.swift
//  AssignmentSignUp
//
//  Created by Jaehui Yu on 2/25/24.
//

import UIKit
import SnapKit

class PhoneNumberViewController: UIViewController {
    let phoneNumberTextField = UITextField()
    let phoneNumberStateLabel = UILabel()
    
    let viewModel = PhoneNumberViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureView()
        configureConstraints()

        viewModel.output.bind { value in
            self.phoneNumberStateLabel.text = value
        }
    }
    
    func configureHierarchy() {
        view.addSubview(phoneNumberTextField)
        view.addSubview(phoneNumberStateLabel)
    }
    
    func configureView() {
        phoneNumberTextField.placeholder = "전화번호"
        phoneNumberTextField.textAlignment = .center
        phoneNumberTextField.backgroundColor = .lightGray
        phoneNumberTextField.clipsToBounds = true
        phoneNumberTextField.layer.cornerRadius = 10
        phoneNumberTextField.addTarget(self, action: #selector(phoneNumberChanged), for: .editingChanged)
    }
    
    @objc func phoneNumberChanged() {
        viewModel.input.value = phoneNumberTextField.text!
    }
    
    func configureConstraints() {
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        phoneNumberStateLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
    }

}
