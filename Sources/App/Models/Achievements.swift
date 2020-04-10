//
//  Achievements.swift
//  App
//
//  Created by Jonathan Green on 4/8/20.
//


import Vapor
import MeowVapor

final class Achievements:Content,Model {
    var _id:String
    var success:Bool?
    var status:Int?
    var overview:OverView
    var achievements:[Achievement]
}

final class Achievement:Content {
    var id:Int
    var level:String
    var progress:Int
    var total:Int
    var bg_image_url:String
    var accessible:Bool
}

final class OverView:Content {
    var title:String
}
