//
//  MedicineViewModel.swift
//  AssignmentSignUp
//
//  Created by Jaehui Yu on 2/26/24.
//

import Foundation
import Alamofire

class MedicineViewModel {
    
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    var outputMedicineItems: Observable<[Items]> = Observable([])
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
        }
    }
    
    private func callRequest() {
        let url = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=\(APIKey.serviceKey)&type=json"
        AF.request(url).responseDecodable(of: Medicine.self) { response in
            switch response.result {
            case .success(let success):
                self.outputMedicineItems.value = success.body?.items ?? []
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
