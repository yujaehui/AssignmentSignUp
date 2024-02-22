//
//  Observable.swift
//  AssignmentLogin
//
//  Created by Jaehui Yu on 2/22/24.
//

import Foundation

class Observable {
    private var closure: ((String) -> Void)?
    
    // 2.
    // 뷰컨트롤러에 있던 텍스트필드의 텍스트가 변할 때마다
    // 해당 텍스트가 들어오는 곳이 바로 이 곳
    var text: String {
        didSet {
            print("closure를 실행합니다")
            // 텍스트가 변할 때마다 텍스트를 매개변수로 하여금 클로저를 실행
            closure?(text) // 호출
            // 그렇다면 이 클로저는 무엇일까?
            // input에 대한 클로저는 뷰모델에 있고, output에 대한 클로저는 뷰컨트롤러에 있음
        }
    }
    
    init(text: String) {
        self.text = text
    }
    
    // 4.
    // 외부에서 적은 내용들이 이 곳의 클로저라는 매개변수로 들어갈 것이고
    // 그 클로저는 현재 Observable 내의 클로저에 넣어줄 것임...
    func bind(_ closure: @escaping (String) -> Void) {
        print(#function)
        closure(text)
        self.closure = closure // 외부에서 받아온 클로저를 해당 클래스 내의 클로저에 넣어줌
    }
}
