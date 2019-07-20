/*
    Copyright (C) 2017 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A struct used throughout the sample to represent example data.
*/

import Foundation
import SwiftyJSON

struct Archive : Codable{
    //    "dimension" : {
    //            "height" : 818,
    //            "width" : 1920,
    //            "rotate" : 0
    //        },
    var cid:String
    var pic: String
    var owner:Owner
    var videos:Int
    var tid :String
    var ctime:String
    var duration:String
    var desc:String
    var title :String
    var pubdate:String
    var state:Int
    var attribute:String
    var tname:String
    var copyright:Int
    //        "rights" : {
    //            "no_reprint" : 1,
    //            "elec" : 0,
    //            "pay" : 0,
    //            "movie" : 0,
    //            "autoplay" : 0,
    //            "hd5" : 0,
    //            "download" : 0,
    //            "bp" : 0
    //        },
    var aid :String
    //        "stat" : {
    //            "aid" : 58903561,
    //            "view" : 3825,
    //            "his_rank" : 0,
    //            "now_rank" : 0,
    //            "like" : 223,
    //            "danmaku" : 40,
    //            "favorite" : 47,
    //            "dislike" : 0,
    //            "reply" : 43,
    //            "share" : 12,
    //            "coin" : 58
    //        },
    var dynamic:String
    
    init(jsonData:JSON) {
        self.cid = jsonData["cid"].stringValue
        self.pic = jsonData["pic"].stringValue
        self.owner = Owner(jsonData: jsonData["role"])
        self.videos = jsonData["videos"].int!
        self.tid = jsonData["tid"].stringValue
        self.ctime = jsonData["ctime"].stringValue
        self.duration = jsonData["duration"].stringValue
        self.desc = jsonData["desc"].stringValue
        self.title = jsonData["title"].stringValue
        self.pubdate = jsonData["pubdate"].stringValue
        self.state = jsonData["state"].int!
        self.attribute = jsonData["attribute"].stringValue
        self.tname = jsonData["tname"].stringValue
        self.copyright = jsonData["copyright"].int!
        self.aid = jsonData["aid"].stringValue
        self.dynamic = jsonData["dynamic"].stringValue
    }
}

struct OfficialVerify: Codable {
    var role :Int
    var title :String
    var desc :String
    
    init(jsonData:JSON) {
        self.role = jsonData["role"].int!
        self.title = jsonData["title"].stringValue
        self.desc = jsonData["desc"].stringValue
    }
}

struct Owner : Codable{
    var mid:String
    var name:String
    var face:String
    
    init(jsonData:JSON) {
        self.mid = jsonData["mid"].stringValue
        self.name = jsonData["name"].stringValue
        self.face = jsonData["face"].stringValue
    }
}

struct SubscriptionsCellDateItem: Codable, Equatable {
    
    let id: String
    let fold: String
    let bangumi: String
    var archive: Archive
    var official_verify : OfficialVerify
    let type:Int
    let pubdate :String
    
    
    init(jsonData:JSON) {
        self.id = jsonData["id"].stringValue
        self.fold = jsonData["fold"].stringValue
        self.bangumi = jsonData["bangumi"].stringValue
        self.archive = Archive(jsonData: jsonData["archive"])
        self.official_verify = OfficialVerify(jsonData: jsonData["official_verify"])
        self.type = jsonData["type"].int!
        self.pubdate = jsonData["pubdate"].stringValue
    }
//    var displayURL: URL {
//        var components = URLComponents()
//        components.scheme = "uikitcatalog"
//        components.path = "dataItem"
//        components.queryItems = [URLQueryItem(name: "identifier", value: identifier)]
//
//        return components.url!
//    }
//
//    var imageURL: URL {
//        let mainBundle = Bundle.main
//        guard let imageURL = mainBundle.url(forResource: imageName, withExtension: nil) else { fatalError("Error determining local image URL.") }
//
//        return imageURL
//    }
}

// MARK: Equatable

func ==(lhs: SubscriptionsCellDateItem, rhs: SubscriptionsCellDateItem)-> Bool {
    // Two `DataItem`s are considered equal if their identifiers and titles match.
    return lhs.id == rhs.id
}