//
//  AppModel.swift
//  TotalityAssignment
//
//  Created by Thanga Ayyanar A on 06/11/21.
//

import Foundation

struct AppModel {
    
    let appName: String
    let appDescription: String
    let imageName: String
    
    static func getDummyModel() -> AppModel {
        return AppModel(appName: "Pokemon", appDescription: "Pokemon, which is short for pocket monster,has become a phenomenal success in America among children.  There are cartoons and even a movie based on the Pokemon characters.", imageName: "pichu")
    }
}
