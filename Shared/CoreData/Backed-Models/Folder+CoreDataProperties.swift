//
//  Playlist+CoreDataProperties.swift
//  BookPlayerKit
//
//  Created by Gianni Carlo on 4/23/19.
//  Copyright © 2019 Tortuga Power. All rights reserved.
//
//

import CoreData
import Foundation

extension Folder {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var desc: String!
    @NSManaged public var items: NSOrderedSet?
}

// MARK: Generated accessors for books

extension Folder {
    @objc(insertObject:inItemsAtIndex:)
    @NSManaged public func insertIntoItems(_ value: LibraryItem, at idx: Int)

    @objc(removeObjectFromItemsAtIndex:)
    @NSManaged public func removeFromItems(at idx: Int)

    @objc(insertItems:atIndexes:)
    @NSManaged public func insertIntoItems(_ values: [LibraryItem], at indexes: NSIndexSet)

    @objc(removeItemsAtIndexes:)
    @NSManaged public func removeFromItems(at indexes: NSIndexSet)

    @objc(replaceObjectInItemsAtIndex:withObject:)
    @NSManaged public func replaceItems(at idx: Int, with value: LibraryItem)

    @objc(replaceItemsAtIndexes:withBooks:)
    @NSManaged public func replaceItems(at indexes: NSIndexSet, with values: [LibraryItem])

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: LibraryItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: LibraryItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSOrderedSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSOrderedSet)
}
