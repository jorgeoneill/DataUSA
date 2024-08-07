import XCTest
@testable import DataUSA

@MainActor
final class NationDetailViewUnitTests: XCTestCase {
    
    // MARK: System under test poperty
    var sut: NationDetailView.ViewModel?

    override func setUpWithError() throws {
        guard let nationItem = DataService.generateLatestNationData().first else {
            return
        }
        sut = NationDetailView.ViewModel(nation: nationItem)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_emptyViewTitlePropertyCorrectlySetup_whenEntriesAreEmpty () async throws {
        guard let sut else { return }

        // 1. given
        // 2. when
        // sut.updateNationEntries() not yet called

        // 3. then
       
        XCTAssertEqual(sut.emptyViewTitle, "Loading data...", "Unexpected value")
    }
    
    func test_emptyViewTitlePropertyCorrectlySetup_whenEntriesAreUpdated () async throws {
        guard let sut else { return }

        // 1. given
        // 2. when
        try await sut.updateNationEntries()
        // 3. then
       
        XCTAssertNil(sut.emptyViewTitle, "Unexpected value")
    }
    
    func test_footerTitlePropertyCorrectlySetup_whenEntriesAreUpdated() async throws {
        guard let sut else { return }
        
        // 1. given
        // 2. when
        try await sut.updateNationEntries()
        // 3. then
        
        XCTAssertEqual(sut.footerTitle, "Number of entries: 10", "Unexpected value")
    }
    
    func testNavigationTitlePropertyCorrectlySetup_whenEntriesAreUpdated() async throws {
        guard let sut else { return }
        
        // 1. given
        // 2. when
        try await sut.updateNationEntries()
        // 3. then
        
        XCTAssertEqual(sut.navigationTitle, "United States", "Unexpected value")
    }
}
