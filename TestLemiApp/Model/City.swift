//
//  City.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import Foundation
import Alamofire
import RxDataSources
struct City : Decodable {
    var name : String?
    var subtitle: String?
    var country_code: String?
    var population: Int?
    var longitude: Double?
    var latitude : Double?
    var type : String?
    var id : String?
    var banner: String?
    var zoom: Int?
    var color: String?
}


