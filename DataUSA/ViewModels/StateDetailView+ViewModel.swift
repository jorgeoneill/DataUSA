import SwiftUI

extension StateDetailView {
    @Observable
    @MainActor
    class ViewModel {
        // MARK: - Public properties
        var displayAlert = false
        var alertMessage = ""

        // MARK: - Private(set) properties
        private(set) var emptyViewTitle: String?
        private(set) var footerTitle: String
        private(set) var navigationTitle: String
        private(set) var stateCellViewModels:  [StateCellView.ViewModel]
        
        // MARK: - Private properties
        private var stateEntries: [StateData.StateItem] = [StateData.StateItem]() {
            didSet {
                populateStateEntries()
            }
        }
        private let stateId: String?
        
        // MARK: - Lifecycle
        init(state: StateData.StateItem?) {
            self.stateId = state?.id
            self.stateCellViewModels = [StateCellView.ViewModel]()
            self.emptyViewTitle = Constants.Text.emptyViewTitle
            self.footerTitle = "\(Constants.Text.numberOfEntriesLabel)\(0)"
            self.navigationTitle = state?.name ?? Constants.Text.defaultNavigationTitle
        }
        
        // MARK: - Public methods
        func updateStateEntries() async throws {
            guard stateEntries.isEmpty else { return }

            stateEntries = try await DataService.fetchStateData(historical: true, specificState: stateId)
            emptyViewTitle = nil
        }
                
        // MARK: - Private methods
        private func populateStateEntries() {
            self.stateCellViewModels = stateEntries.map { state in
                StateCellView.ViewModel(state: state, historicalItem: true)
            }
            footerTitle = "\(Constants.Text.numberOfEntriesLabel)\(stateEntries.count)"
        }
    }
}
