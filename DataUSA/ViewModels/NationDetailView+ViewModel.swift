import SwiftUI

extension NationDetailView {
    @Observable
    @MainActor
    class ViewModel {
        // MARK: - Private(set) properties
        private(set) var emptyViewTitle: String?
        private(set) var footerTitle: String
        private(set) var navigationTitle: String
        private(set) var nationCellViewModels:  [NationCellView.ViewModel]
        
        // MARK: - Private properties
        private var nationEntries: [NationData.NationItem] = [NationData.NationItem]() {
            didSet {
                populateNationEntries()
            }
        }
        
        // MARK: - Lifecycle
        init(nation: NationData.NationItem?) {
            self.nationCellViewModels = [NationCellView.ViewModel]()
            self.emptyViewTitle = Constants.Text.emptyViewTitle
            self.footerTitle = "\(Constants.Text.numberOfEntriesLabel)\(0)"
            self.navigationTitle = nation?.name ?? Constants.Text.defaultNavigationTitle
        }
        
        // MARK: - Public methods
        func updateStatesList() async throws {
            guard nationEntries.isEmpty else { return }

            nationEntries = try await DataService.fetchNationData(historical: true)
            emptyViewTitle = nil
        }
                
        // MARK: - Private methods
        private func populateNationEntries() {
            self.nationCellViewModels = nationEntries.map { nation in
                NationCellView.ViewModel(nation: nation, historicalItem: true)
            }
            footerTitle = "\(Constants.Text.numberOfEntriesLabel)\(nationEntries.count)"
        }
    }
}
