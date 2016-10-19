//
//  PeopleTool.swift
//  coreDataTest
//
//  Created by HUA on 16/10/18.
//  Copyright © 2016年 HUA. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class PeopleTool: NSObject {
      static let shared = PeopleTool()
      var people :[NSManagedObject] = []
    func getContext () -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        return managedContext
    }
    func getPerson()->(NSArray){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        do {
            let searchResults = try getContext()?.fetch(fetchRequest)
            print("numbers of \((searchResults?.count)!)")
            
            for p in (searchResults as! [NSManagedObject]){
                print("name:  \(p.value(forKey: "name")!) age: \(p.value(forKey: "age")!)")
            }
            return searchResults as! [NSManagedObject] as (NSArray)
        } catch  {
            print(error)
            return []
        }
        
    }
    func savePeople(name:String, age:Int){
        let context = getContext()
        // 定义一个entity，这个entity一定要在xcdatamodeld中做好定义
        let entity = NSEntityDescription.entity(forEntityName: "People", in: context!)
        
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValue(name, forKey: "name")
        person.setValue(age, forKey: "age")
        
        
        do {
            try context?.save()
            print("saved")
        }catch{
            print(error)
        }
    }
    
    func deleteAllObjects(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        do {
          let searchResults = try getContext()?.fetch(fetchRequest)
            print("numbers of \((searchResults?.count)!)")
            if (searchResults?.count)! != 0 {
             let context = getContext()
            for model in (searchResults as! [NSManagedObject]){
                context?.delete(model)
            }
            do {
                try context?.save()
                print("delectSuccess")
            }catch{
                print("delectFail")
            }
            }
        }catch  {
            print(error)
          
        }
            

    }
    
    func updateDataWithCoreData()
    {
        let context = getContext()
        // 定义一个entity，这个entity一定要在xcdatamodeld中做好定义
        let entity = NSEntityDescription.entity(forEntityName: "People", in: context!)
          let request = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        
        let condition = "name='黄泽华'"
        let predicate = NSPredicate(format: condition,"")
        request.entity = entity
        request.predicate = predicate
        do{
            let userList  = try getContext()?.fetch(request) as! [Developer] as NSArray
            if userList.count != 0 {
                let user = userList[0] as! Developer
                 Developer.setValue("小公举", forKey: "name")
                try context?.save()
                print("修改成功 ~ ~")
            }else{
                print("修改失败，没有符合条件的联系人！")
            }
        }catch{
            print("修改失败 ~ ~")
        }
        
    }
    
}
