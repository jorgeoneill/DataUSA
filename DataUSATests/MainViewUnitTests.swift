
/*
 private(set) var emptyViewTitle: String?
 private(set) var footerTitle: String
 private(set) var navigationTitle: String

 */
import XCTest
@testable import DataUSA

@MainActor
final class MainViewUnitTests: XCTestCase {
    
    // MARK: System under test poperty
    var sut: MainView.ViewModel?

    override func setUpWithError() throws {
        sut = MainView.ViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_emptyViewTitlePropertyCorrectlySetup_whenEntriesAreEmpty () async throws {
        guard let sut else { return }

        // 1. given
        // 2. when
        // sut.updateNation() not yet called

        // 3. then
       
        XCTAssertEqual(sut.emptyViewTitle, "Loading data...", "Unexpected value")
    }
    
    func test_emptyViewTitlePropertyCorrectlySetup_whenEntriesAreUpdated () async throws {
        guard let sut else { return }

        // 1. given
        // 2. when
        try await sut.updateNation()
        // 3. then
       
        XCTAssertNil(sut.emptyViewTitle, "Unexpected value")
    }
    
    func test_footerTitlePropertyCorrectlySetup_whenEntriesAreUpdated() async throws {
        guard let sut else { return }
        
        // 1. given
        // 2. when
        try await sut.updateStatesList()
        // 3. then
        
        XCTAssertEqual(sut.footerTitle, "Number of states: 52", "Unexpected value")
    }
    
    func testNavigationTitlePropertyCorrectlySetup_whenEntriesAreUpdated() async throws {
        guard let sut else { return }
        
        // 1. given
        // 2. when
        try await sut.updateStatesList()
        // 3. then
        
        XCTAssertEqual(sut.navigationTitle, "Population", "Unexpected value")
    }
}
