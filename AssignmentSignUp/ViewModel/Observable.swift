//
//  Observable.swift
//  AssignmentLogin
//
//  Created by Jaehui Yu on 2/22/24.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)?
    
    // 2.
    // 뷰컨트롤러에 있던 텍스트필드의 텍스트가 변할 때마다 해당 텍스트가 들어오는 곳이 바로 이 곳
    var value: T {
        didSet {
            print("closure를 실행합니다")
            // 텍스트가 변할 때마다 텍스트를 매개변수로 하여금 listener 실행
            listener?(value) // 호출
            // 그렇다면 이 listener는 무엇일까?
            // input에 대한 listener는 뷰모델에 있고, output에 대한 listener는 뷰컨트롤러에 있음
        }
    }
    
    // 현재 클로저가 private이기 때문에 bind를 통하는 것을 알겠음
    // 근데 왜 closure에 바로 접근하지 않고 이렇게 접근하는 걸까..
    // 그건 바로 didSet의 시점 때문에 !
    // didSet은 값이 변할 때만 실행되지, 초기화 시점에는 실행되지 않음
    // 즉 closure에 접근하게 되면 가장 초기값은 어떻게 해줄 수가 없음 ㅜㅜ
    // 그래서 bind내에 closure(text)를 이용해서 bind가 작성되는 시점에도 실행되도록 해서 초기값도 처리할 수 있도록 함!
    
    init(_ value: T) {
        self.value = value
    }
    
    // 4.
    // 외부에서 적은 내용들이 이 곳의 클로저라는 매개변수로 들어갈 것이고
    // 그 클로저는 현재 Observable 내의 listener에 넣어줄 것임...
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value) // 값이 변하지 않아도 작성되는 시점에 바로 실행될 수 있게끔
        self.listener = closure // 외부에서 받아온 클로저를 해당 클래스 내의 클로저에 넣어줌
    }
}
