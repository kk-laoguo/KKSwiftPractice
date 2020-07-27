//
//  Item.swift
//  TestQiushi
//
//  Created by zainguo on 2020/7/15.
//  Copyright © 2020 zainguo. All rights reserved.
//


import KakaJSON

struct Item: Convertible {
    let content: String = ""
    let commentsCount: Int = 0
    let lowUrl: String = ""
    let originUrl: String = ""

    let publishedAt: Int = 0
    let user: User! = nil
    let hostComment: Comment? = nil
//    func kj_modelKey(from property: Property) -> ModelPropertyKey {
//
////        switch property.name {
////        case "commentsCount": return "comments_count"
////        case "commentsCount": return "comments_count"
////
////        default:
////
////        }
//    }
    
}

