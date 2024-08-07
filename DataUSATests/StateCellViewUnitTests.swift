import XCTest
@testable import DataUSA

@MainActor
final class StateCellViewUnitTests: XCTestCase {
    
    // MARK: System under test poperty
    var sut: StateCellView.ViewModel?

    override func setUpWithError() throws {
        guard let stateItem = DataService.generateLatestStateData().first else {
            return
        }
        sut = StateCellView.ViewModel(state: stateItem)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_title_propertyCorrectlySetup() throws {
        guard let sut else { return }
       
        XCTAssertEqual(sut.title, "Alabama", "Unexpected title text")
    }
    
    func test_subtitlePropertyCorrectlySetup() throws {
        guard let sut else { return }
       
        XCTAssertEqual(sut.subtitle, "Current population: 5 028 092", "Unexpected subtitle text")
    }

}
