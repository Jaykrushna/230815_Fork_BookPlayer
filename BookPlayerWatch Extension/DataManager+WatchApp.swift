//
//  DataManager+WatchApp.swift
//  BookPlayerWatch Extension
//
//  Created by Gianni Carlo on 4/27/19.
//  Copyright © 2019 Tortuga Power. All rights reserved.
//

import BookPlayerWatchKit

extension DataManager {
  public static let libraryDataUrl = FileManager.default
    .urls(for: .documentDirectory, in: .userDomainMask).first!
    .appendingPathComponent("library.data")

  public static let booksDataUrl = FileManager.default
    .urls(for: .documentDirectory, in: .userDomainMask).first!
    .appendingPathComponent("library.books.data")

  public func loadLibrary() -> Library {
    return self.decodeLibrary(FileManager.default.contents(atPath: DataManager.libraryDataUrl.path),
                              booksData: FileManager.default.contents(atPath: DataManager.booksDataUrl.path))
    ?? Library(context: self.getContext())
  }

  public func decodeLibrary(_ data: Data?, booksData: Data?) -> Library? {
    guard let data = data else { return nil }

    try? data.write(to: DataManager.libraryDataUrl)
    try? booksData?.write(to: DataManager.booksDataUrl)

    let bgContext = self.getBackgroundContext()
    let decoder = JSONDecoder()

    guard let context = CodingUserInfoKey.context else { return nil }

    decoder.userInfo[context] = bgContext

    guard let library = try? decoder.decode(Library.self, from: data) else {
      return nil
    }

    if let booksData = booksData,
        let books = try? decoder.decode([Book].self, from: booksData) {
      library.items = NSOrderedSet(array: books)
    }

    return library
  }
}
