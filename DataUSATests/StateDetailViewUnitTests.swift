import XCTest
@testable import DataUSA

/*
 private(set) var emptyViewTitle: String?
 private(set) var footerTitle: String
 private(set) var navigationTitle: String
 private(set) var nationCellViewModels:  [NationCellView.ViewModel]

 */

@MainActor
final class StateDetailViewUnitTests: XCTestCase {
    
    // MARK: System under test poperty
    var sut: StateDetailView.ViewModel?

    override func setUpWithError() throws {
        guard let stateItem = DataService.generateLatestStateData().first else {
            return
        }
        sut = StateDetailView.ViewModel(state: stateItem)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_emptyViewTitlePropertyCorrectlySetup_whenEntriesAreEmpty () async throws {
        guard let sut else { return }

        // 1. given
        // 2. when
        // sut.updateStateEntries() not yet called

        // 3. then
       
        XCTAssertEqual(sut.emptyViewTitle, "Loading data...", "Unexpected value")
    }
    
    func test_emptyViewTitlePropertyCorrectlySetup_whenEntriesAreUpdated () async throws {
        guard let sut else { return }

        // 1. given
        // 2. when
        try await sut.updateStateEntries()
        // 3. then
       
        XCTAssertNil(sut.emptyViewTitle, "Unexpected value")
    }
    
    func test_footerTitlePropertyCorrectlySetup_whenEntriesAreUpdated() async throws {
        guard let sut else { return }
        
        // 1. given
        // 2. when
        try await sut.updateStateEntries()
        // 3. then
        
        XCTAssertEqual(sut.footerTitle, "Number of entries: 10", "Unexpected value")
    }
    
    func testNavigationTitlePropertyCorrectlySetup_whenEntriesAreUpdated() async throws {
        guard let sut else { return }
        
        // 1. given
        // 2. when
        try await sut.updateStateEntries()
        // 3. then
        
        XCTAssertEqual(sut.navigationTitle, "Alabama", "Unexpected value")
    }
}
