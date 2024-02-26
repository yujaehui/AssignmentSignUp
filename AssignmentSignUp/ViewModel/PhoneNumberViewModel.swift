//
//  PhoneNumberViewModel.swift
//  AssignmentSignUp
//
//  Created by Jaehui Yu on 2/25/24.
//

import Foundation

class PhoneNumberViewModel {
    var input = Observable("")
    var output = Observable("")
    
    init() {
        input.bind { value in
            self.validation(value)
        }
    }
    
    func validation(_ input: String) {
        if input.isEmpty {
            output.value = "전화번호를 입력해주세요"
        } else if isNumeric(input: input) == false {
            output.value = "숫자만 입력해주세요"
        } else if input.count != 11 {
            output.value = "전화번호는 총 11자리로 입력해주세요"
        } else {
            output.value = "입력한 전화번호: \(input)"
        }
        
    }
    
    func isNumeric(input: String) -> Bool {
        if let _ = Int(input) {
            return true
        } else {
            return false
        }
    }
}
