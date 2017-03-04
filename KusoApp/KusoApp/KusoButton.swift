//
//  KusoButton.swift
//  KusoApp
//
//  Created by ANNotunzdY on 2017/03/04.
//  Copyright © 2017 Kibousoft LLC. All rights reserved.
//

import UIKit

class KusoButton: UIButton {

    var number = 0 {
        didSet {
            setTitle(String(number), for: .normal)
        }
    }

}
