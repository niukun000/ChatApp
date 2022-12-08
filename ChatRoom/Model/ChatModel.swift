//
//  ChatModel.swift
//  ChatRoom
//
//  Created by Kun Niu on 12/1/22.
//

import Foundation


struct Users {
    let users : [User]
}
struct User {
    let email : String
    let userName : String
    let message : String
    
}

struct Messages{
    let message:[Message]
}

struct Message {
//    let id : Int
    let user : String
    let time : String
    let message : String
}
