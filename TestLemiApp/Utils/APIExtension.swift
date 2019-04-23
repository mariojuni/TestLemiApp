//
//  APIExtension.swift
//  paymentFacilitator
//
//  Created by Mario Juni on 04/12/2018.
//  Copyright © 2018 VeritasPay. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

extension Request: ReactiveCompatible {}

extension Reactive where Base: DataRequest {
    
    func responseJSON() -> Observable<Any> {
        return Observable.create { observer in
            
            let request = self.base.responseJSON {
                response in
                print("JSON REQUEST : \(String(describing:  NSString(data: response.request?.httpBody ?? Data(), encoding: String.Encoding.utf8.rawValue)))")
                print("JSON RESPONSE \(response.debugDescription  )")
                switch response.result {
                case .success(_ ):
                    observer.onNext(response.data!)
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create(with: request.cancel)
        }
    }
}
