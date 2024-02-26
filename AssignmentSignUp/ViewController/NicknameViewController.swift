//
//  NicknameViewController.swift
//  AssignmentLogin
//
//  Created by Jaehui Yu on 2/22/24.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController {
    let nicknameTextField = UITextField()
    let nicknameStateLabel = UILabel()
    
    let viewModel = NicknameViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureView()
        configureConstraints()
        
        // 3.
        viewModel.output.bind { text in
            self.nicknameStateLabel.text = text
            // text라는 매개변수를 받아서
            // 뷰컨트롤러가 가지고 있는 nicknameStateLabel.text에 넣어줌
            // 이 내용 자체가 bind의 매개변수로 가는 것 !
        }
    }
    
    func configureHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(nicknameStateLabel)
    }
    
    func configureView() {
        nicknameTextField.placeholder = "별명"
        nicknameTextField.textAlignment = .center
        nicknameTextField.backgroundColor = .lightGray
        nicknameTextField.clipsToBounds = true
        nicknameTextField.layer.cornerRadius = 10
        nicknameTextField.addTarget(self, action: #selector(nicknameChanged), for: .editingChanged)
    }
    
    @objc func nicknameChanged() {
//        guard let text = nicknameTextField.text else { return }
//        if text.isEmpty {
//            nicknameStateLabel.text = "별명을 입력해주세요"
//        } else if text.contains(" ") {
//            nicknameStateLabel.text = "별명에 공백은 입력할 수 없어요"
//        } else if text.count < 2 || text.count > 10 {
//            nicknameStateLabel.text = "별명은 2글자에서 10글자 사이로 입력해주세요"
//        } else {
//            nicknameStateLabel.text = "이 별명은 사용이 가능해요"
//        }
        
//        nicknameStateLabel.text = viewModel.validation(nicknameTextField.text)
        
//        viewModel.input = nicknameTextField.text
//        nicknameStateLabel.text = viewModel.output
        
        // 시작점
        // 텍스트필드의 텍스트가 변경될 때마다 그 텍스트를 어디에 넣어줄 것인가?
        // 뷰모델의 인풋이라는 변수가 있을건데
        // 그 인풋이라는 변수의 타입은 Observable Class
        // 그리고 Observable내에서는 text라는 변수가 있음. 이곳이 최종 목적지
        viewModel.input.value = nicknameTextField.text!
        
    }
    
    func configureConstraints() {
        nicknameTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        nicknameStateLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
    }
}
