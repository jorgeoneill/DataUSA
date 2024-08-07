import Foundation

extension MainView {
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
        private(set) var nationCellViewModel:  NationCellView.ViewModel?
               
        // MARK: - Private properties
        private var states: [StateData.StateItem] = [StateData.StateItem]() {
            didSet {
                populateStatesData()
            }
        }
        private var nation: NationData.NationItem? = nil {
            didSet {
                populateNationData()
            }
        }

        // MARK: - Lifecycle
        init() {
            self.stateCellViewModels = [StateCellView.ViewModel]()
            self.nationCellViewModel = nil
            self.emptyViewTitle = Constants.Text.emptyViewTitle
            self.footerTitle = "\(Constants.Text.numberOfStatesLabel)\(0)"
            self.navigationTitle = Constants.Text.defaultNavigationTitle
        }
        
        // MARK: - Public methods
        func updateStatesList() async throws {
            guard states.isEmpty else { return }

            states = try await DataService.fetchStateData()
        }
        
        func updateNation() async throws {
            guard nation == nil else { return }

            let nations = try await DataService.fetchNationData()
            nation = nations.first
            emptyViewTitle = nil

        }
        
        // MARK: - Private methods
        private func populateStatesData() {
            self.stateCellViewModels = states.map { state in
                StateCellView.ViewModel(state: state)
            }
            footerTitle = "\(Constants.Text.numberOfStatesLabel)\(states.count)"
        }
        
        private func populateNationData() {
            guard let nation else { return }

            self.nationCellViewModel = NationCellView.ViewModel(nation: nation)
        }
    }
}
