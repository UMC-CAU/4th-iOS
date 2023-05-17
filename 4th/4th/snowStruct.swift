//
//  dumy.swift
//  4th
//
//  Created by 정의찬 on 2023/05/03.
//

import UIKit

struct snowChar{
    let title: String
    var image: String
}

extension snowChar{
    static var data = [
        snowChar(title:"happy" , image: "snow"),
        snowChar(title: "cute", image: "snow1"),
        snowChar(title: "serious", image: "snow2"),
        snowChar(title: "determination", image: "snow3"),
        snowChar(title: "confident", image: "snow4"),
        snowChar(title: "sad", image: "snow5")
    ]
}
