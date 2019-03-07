//
//  Score.swift
//  realmPractice
//
//  Created by ta_fukase on 2019/03/06.
//  Copyright © 2019 ta_fukase. All rights reserved.
//

import Foundation
import RealmSwift

class Score: Object {
    @objc dynamic var name = ""
    @objc dynamic var score = 0
}
