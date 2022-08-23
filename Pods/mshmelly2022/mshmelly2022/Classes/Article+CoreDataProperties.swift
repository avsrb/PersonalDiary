//
//  Article+CoreDataProperties.swift
//  mshmelly2022
//
//  Created by Artem Serebriakov on 23.08.2022.
//
//

import Foundation
import CoreData

extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var modificationDate: Date?
    
    override public var description:String {
        let titele: String = "TITLE: \(String(describing: title))\n"
        let content: String = "CONTENT: \(String(describing: content))\n"
        let language: String = "LANGUAGE: \(String(describing: language))\n"
        let image: String = "IMAGE: \(String(describing: image))\n"
        let creationDate: String = "CREATION DATE: \(String(describing: creationDate))\n"
        let modificationDate: String = "MODIFICATION DATE: \(String(describing: modificationDate))"
        
        return titele + content + language + image + creationDate + modificationDate
    }
}
