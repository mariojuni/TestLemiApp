//
//  FailableDecodable.swift
//  TestLemiApp
//
//  Created by Mario Juni on 23/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import Foundation
struct FailableDecodable<Base : Decodable> : Decodable {
    
    let base: Base?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
