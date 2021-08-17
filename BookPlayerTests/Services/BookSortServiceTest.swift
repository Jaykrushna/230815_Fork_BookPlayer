@testable import BookPlayer
@testable import BookPlayerKit
import XCTest

class BookSortServiceTest: XCTestCase {
    let unorderedBookNames = [
        "05 Book 1",
        "01 Book 1",
        "09 Book 10",
        "09 Book 2"
    ]

    let orderedBookNames = [
        "01 Book 1.txt",
        "05 Book 1.txt",
        "09 Book 2.txt",
        "09 Book 10.txt"
    ]

    var booksByFile: NSOrderedSet?

    override func setUp() {
      let documentsFolder = DataManager.getDocumentsFolderURL()
      DataTestUtils.clearFolderContents(url: documentsFolder)
      let processedFolder = DataManager.getProcessedFolderURL()
      DataTestUtils.clearFolderContents(url: processedFolder)

      self.booksByFile = NSOrderedSet(array: self.unorderedBookNames.map { StubFactory.book(title: $0, duration: 1000) })
    }

    override func tearDown() {}

    func testSortByFileName() {
        let sortedBooks = BookSortService.sort(self.booksByFile!, by: .fileName)
        let bookNames = sortedBooks.map { (book) -> String in
            guard let book = book as? Book else { return "" }
            return book.originalFileName!
        }

        XCTAssert(bookNames == self.orderedBookNames)
        // swiftlint:enable force_try
    }
}
