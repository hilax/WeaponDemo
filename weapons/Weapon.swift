//
//  Weapon.swift
//  weapons
//
//  Created by Hilax on 2018/5/24.
//  Copyright © 2018年 Hilax. All rights reserved.
//
struct Weapon: Codable {
    var  name = ""
     var type = ""
    var origin = ""
    var image = ""
    var favorite = false
    //子弹类型
    var bullet = 0.0
    //射速
    var mv = 0
    //武器整体介绍
    var text = ""
    //分数
    var reting = ""
    init(name: String, type: String, origin: String, image: String, favorite: Bool, bullet: Double, mv: Int, text: String){
        self.name = name
        self.type = type
        self.origin = origin
        self.image = image
        self.favorite = favorite
        self.bullet = bullet
        self.mv = mv
        self.text = text
    }
    
}
  struct WeaponSpecs: Codable {
    var types = [String]()
    var bullets = [Double]()
    
  }

struct Origin: Codable {
    var continent = ""
    var countries = [String]()
}
