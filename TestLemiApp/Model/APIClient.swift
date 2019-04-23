//
//  ApiRouter.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
public struct APIClient {
    
    let sessionManager: SessionManager
    let backgroundScheduler = ConcurrentDispatchQueueScheduler(qos: .default)
    static let instance = APIClient()
 
    init() {
        sessionManager = SessionManager(
            configuration: URLSessionConfiguration.default
        )
    }
    
    func fetchCity(query : String) -> Observable<[City]?> {
        return request("https://lemi.travel/api/v5/cities?q=\(query)")
            .validate(statusCode: 200..<300)
            .rx.responseJSON()
            .subscribeOn(backgroundScheduler)
            .observeOn(MainScheduler.instance)
            .map({ data -> [City]? in
               
                let decoder = JSONDecoder()
                var decodedData: [City]?
                do {
                    decodedData = try decoder.decode([FailableDecodable<City>].self, from: data as! Data ).compactMap{ $0.base}
                } catch let error as NSError {
                        print(error.localizedDescription)
                }
                return decodedData
                
            })
    }

}
