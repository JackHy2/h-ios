//
//  UserInfoModel.swift
//  WebViewDataStore
//
//  Created by 漫qian-mac on 2024/11/18.
//

import UIKit

@objcMembers class UserInfoModel:NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    

    var name: String = ""
    var phone: String = ""
    var age = 0
    var roleModel: RoleModel?
    
    init(dic: [String: Any]) {
        self.name = dic["name"] as! String
        self.phone = dic["phone"] as! String
        self.age = dic["age"] as! Int
        let dic = dic["roleModel"] as! [String : Any]
        self.roleModel = RoleModel(dic: dic)
    }
    
    // 归档
    func encode(with coder: NSCoder) {
        let allPropertyName = getAllPropertys()
        
        for propertyName in allPropertyName {
            let value = self.value(forKey: propertyName)
            if value == nil { continue }
            coder.encode(value, forKey: propertyName)
        }
        
//        coder.encode(self.name, forKey: "name")
//        coder.encode(self.phone, forKey: "phone")
//        coder.encode(self.age, forKey: "age")
//        coder.encode(self.roleModel, forKey: "roModel")
    }
    // 接档
    required init?(coder: NSCoder) {
        super.init()
        
        let allPropertyName = getAllPropertys()
        
        for propertyName in allPropertyName {
            var value = coder.decodeObject(forKey: propertyName)
            if value == nil {
                value = try? coder.decodeTopLevelObject(of: RoleModel.self, forKey: propertyName)
                if value == nil { continue }
                setValue(value, forKey: propertyName)
                continue
            }
            setValue(value, forKeyPath: propertyName)
        }

//        self.name = coder.decodeObject(forKey: "name") as! String
//        self.phone = coder.decodeObject(forKey: "phone") as! String
//        self.age = coder.decodeInteger(forKey: "age")
////        let dic = try? coder.decodeTopLevelObject(of: NSDictionary.self, forKey: "roModel")
////        self.roleModel = RoleModel(dic: dic as! [String : Any])
//        self.roleModel = try? coder.decodeTopLevelObject(of: RoleModel.self, forKey: "roModel")
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.phone, forKey: .phone)
//        try container.encode(self.age, forKey: .age)
//    }
//    enum CodingKeys: CodingKey {
//        case name
//        case phone
//        case age
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.phone = try container.decode(String.self, forKey: .phone)
//        self.age = try container.decode(Int.self, forKey: .age)
//    }
    
    private func getAllPropertys() -> [String] {
        var count: UInt32 = 0
        let propertys = class_copyPropertyList(self.classForCoder, &count)
        var propertyNames: [String] = []
        for i in 0..<Int(count) {
            if let property = propertys?[i] {
                let name = property_getName(property)
                let strName = String(cString: name)
                propertyNames.append(strName)
            }
        }
        free(propertys)
        return propertyNames
    }
}

@objcMembers class RoleModel: NSObject, NSSecureCoding {
    var roleName: String = ""
    var roleId: String = ""
    var roleDescrip: String = ""
    
    init(dic: [String: Any]) {
        self.roleName = dic["roleName"] as! String
        self.roleId = dic["roleId"] as! String
        self.roleDescrip = dic["roleDescrip"] as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.roleName, forKey: "roleName")
        coder.encode(self.roleId, forKey: "roleId")
        coder.encode(self.roleDescrip, forKey: "roleDescrip")
    }
    
    required init?(coder: NSCoder) {
        self.roleName = coder.decodeObject(forKey: "roleName") as! String
        self.roleId = coder.decodeObject(forKey: "roleId") as! String
        self.roleDescrip = coder.decodeObject(forKey: "roleDescrip") as! String
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
}


class UserTools {
    
    enum FileName {
        
    case userInfo
    case otherInfo
        
//       static var fName: String {
//            switch self {
//            case: .userInfo
//                return "UserInfo"
//            case: .otherInfo
//                return "OtherInfo"
//            }
//        }
    }
    
    static func saveData(fileName: String, dic: [String: Any]) {
        let path = filePath(name: fileName)
        let user = UserInfoModel(dic: dic)
        
        do {
            let result = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
            print("the result is: === \(result)")
            let url = NSURL(fileURLWithPath: path) as URL
            try result.write(to: url)
        } catch {
            print("error \(error.localizedDescription)")
        }
    }
    
    static func getData(fileName: String) -> UserInfoModel? {
        
        let path = filePath(name: fileName)
        
        do {
            let data = try! NSData(contentsOfFile: path) as Data

//            let result = try NSKeyedUnarchiver.unarchivedObject(ofClass: UserInfoModel.self, from: data)
            let result = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            return result as? UserInfoModel
        } catch  {
            print(error)
        }
        return nil
    }
    
    static private func filePath(name: String) -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (documentPath as NSString).appendingPathComponent("userInfo.plist")
    }
}
