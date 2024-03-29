//
//  NicknameViewModel.swift
//  AssignmentLogin
//
//  Created by Jaehui Yu on 2/22/24.
//

import Foundation

class NicknameViewModel {
    
    // MARK: - 오로지 함수
//    func validation(_ input: String?) -> String {
//        guard let text = input else { return "" }
//        if text.isEmpty {
//            return "별명을 입력해주세요"
//        } else if text.contains(" ") {
//            return "별명에 공백은 입력할 수 없어요"
//        } else if text.count < 2 || text.count > 10 {
//            return "별명은 2글자에서 10글자 사이로 입력해주세요"
//        } else {
//            return "이 별명은 사용이 가능해요"
//        }
//    }
    
    // MARK: - input, output 프로퍼티 이용
//    var input: String? {
//        didSet {
//            validation()
//        }
//    }
//    
//    var output = ""
//    
//    private func validation() {
//        guard let text = input else { return }
//        if text.isEmpty {
//            output = "별명을 입력해주세요"
//        } else if text.contains(" ") {
//            output = "별명에 공백은 입력할 수 없어요"
//        } else if text.count < 2 || text.count > 10 {
//            output = "별명은 2글자에서 10글자 사이로 입력해주세요"
//        } else {
//            output = "이 별명은 사용이 가능해요"
//        }
//    }
    
    // MARK: - Observable
    var input = Observable("")
    
    var output = Observable("")

    init() {
//        input.closure { text in // 정의
//            self.validation(text)
//        }

        // closure는 private이기 때문에 바로 접근 불가능
        
        // 3.
        input.bind { text in // 정의
            print(text)
            self.validation(text)
            // text라는 매개변수를 받아서
            // 그 매개변수를 validation 메서드에 inputText자리에 넣어주고 validation 메서드를 실행
            // 이 내용 자체가 bind의 매개변수로 가는 것 !
        }
    }
    
    private func validation(_ inputText: String) { // (String) -> Void
        if inputText.isEmpty {
            output.value = "별명을 입력해주세요"
        } else if inputText.contains(" ") {
            output.value = "별명에 공백은 입력할 수 없어요"
        } else if inputText.count < 2 || inputText.count > 10 {
            output.value = "별명은 2글자에서 10글자 사이로 입력해주세요"
        } else {
            output.value = "이 별명은 사용이 가능해요"
        }
    }
}
