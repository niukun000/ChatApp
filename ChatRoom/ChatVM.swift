//
//  ChatVM.swift
//  ChatRoom
//
//  Created by Kun Niu on 12/5/22.
//

import Foundation
import Firebase
class ChatVM {
    var messages : [Message] = []
    
    let path = "messages/"
    let ref : DatabaseReference
    let user = "Kun"
    
    typealias UpdateHandler = () -> ()
    var updateHandler : UpdateHandler?
    
    init(){
//        self.requireData()
        ref = Database.database().reference().child(self.path)
//        ref.setValue(nil)

    }
    
    var count : Int  { self.messages.count }

    var time : String {Date().description}
    
    func bind(updateHandler : @escaping() -> ()){
        self.updateHandler = updateHandler
    }
    
    func postData(content: String){
        let temp = ["UID": "1", "username": self.user, "timestamp": self.time, "body": content]
        ref.child(self.time).setValue(temp)    }
    func requireData(){
//        self.ref.setValue(nil)
//        ref.observe(.childChanged) { data in
//            print(data)
//            self.updateHandler?()
//        }
        ref.observe(.childAdded) { snapshot, err in
            guard let dict = snapshot.value as? [String: AnyObject] else {return}
//            print("!!!!!!!!")
            guard let name = dict["username"] as? String else {return}
//            guard let role = dict["role"] else {return}
//            print(name)
//            print(role)

            guard let content = dict["body"] as? String else {return}
            guard let time = dict["timestamp"] as? String else {return}
            guard let uid = dict["UID"] as? String else {return}
            if name.localizedCaseInsensitiveContains("kun"){
                if uid != "1" {
                    let temp = ["UID": dict["UID"] ?? "", "username": name, "timestamp": time, "body": ""]
                    self.ref.child(time).setValue(temp)
                }
            }
            if content.localizedCaseInsensitiveContains("kun"){
                let temp = ["UID": dict["UID"] ?? "", "username": name, "timestamp": time, "body": ""]
                self.ref.child(time).setValue(temp)

            }

            
            let message = Message(user: name, time: time, message: content)
            self.messages.append(message)
            print(self.messages)
            self.updateHandler?()
            
        }
//        ref.childByAutoId().setValue(["name" : "kun", "time": Date().description, "content": "sofhajfn"])

    }
    
//        var dic : [String : Any] = [:]
//        dic["user"] = "kun"
//        dic["time"] = Date().description
//        dic ["message"] = "afijaoifnaj fjoawhfe foehf ohfo ieoi "
////        let message = Message(user: "Kun", time: Date(timeIntervalSince1970: 1_000_000_000_000), message: "12345")
//        ref.childByAutoId().setValue(["user" : "Kun", "time" : Date(timeIntervalSince1970: 1_000_000_000_000), "message" : "12345"])
//        let _ = ref.getData { Error, data in
//            guard let data = data?.value else{
//
//                print("failed")
//                return
//            }
//            print("***********")
////            var decoder = JSONDecoder()
////            decoder.decode(Mes, from: <#T##Data#>)
//            print(data as? [Message])
//            data.forEach(
//                { e in
//                    print("_______")
//                print(e)
//            })
//            print(datta)
        }
//        print(data)
        

