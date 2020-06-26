//
//  restaurantClass.swift
//  filterRestaurants
//
//  Created by Kaitlyn VanHook on 6/25/20.
//  Copyright © 2020 Kaitlyn VanHook. All rights reserved.
//

import UIKit

class Restaurant {

    var name = ""
    var address = ""
    var tag: [String]

    init(restaurantName : String, restaurantAddress : String, hasTags: [String]) {
        name = restaurantName
        address = restaurantAddress
        tag = hasTags

    }
}


