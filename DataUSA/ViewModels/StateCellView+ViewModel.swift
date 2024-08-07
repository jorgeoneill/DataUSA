import Foundation

extension StateCellView {
    @Observable
    @MainActor
    class ViewModel: Identifiable {
        // MARK: - Private(set) properties
        private(set) var title: String
        private(set) var subtitle: String
        private(set) var detailViewModel: StateDetailView.ViewModel

        // MARK: - Lifecycle
        init(
            state: StateData.StateItem,
            historicalItem: Bool = false
        ) {
            if historicalItem {
                if let year = state.year {
                    title = String(year)
                } else {
                    title = Constants.Text.defaultCellTitle
                }
            } else {
                title = state.name ?? Constants.Text.defaultCellTitle
            }
            
            let populationPrefix = historicalItem ? Constants.Text.historicalItemPopulationPrefix : Constants.Text.latestItemPopulationPrefix

            if let population = state.population {
                subtitle = populationPrefix + population.formatted()
            } else {
                subtitle = Constants.Text.defaultCellSubtitle
            }
            self.detailViewModel = StateDetailView.ViewModel(state: state)
        }
    }
}
