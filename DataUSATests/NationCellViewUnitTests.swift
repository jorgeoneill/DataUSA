import XCTest
@testable import DataUSA

@MainActor
final class NationCellViewUnitTests: XCTestCase {
    
    // MARK: System under test poperty
    var sut: NationCellView.ViewModel?

    override func setUpWithError() throws {
        guard let nationItem = DataService.generateLatestNationData().first else {
            return
        }
        sut = NationCellView.ViewModel(nation: nationItem)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_titlePropertyCorrectlySetup() throws {
        guard let sut else { return }
       
        XCTAssertEqual(sut.title, "United States", "Unexpected title text")
    }
    
    func test_subtitlePropertyCorrectlySetup() throws {
        guard let sut else { return }
       
        XCTAssertEqual(sut.subtitle, "Current population: 331 097 593", "Unexpected subtitle text")
    }

}
