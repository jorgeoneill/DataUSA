import Foundation

extension NationCellView {
    @Observable
    @MainActor
    class ViewModel: Identifiable {
        // MARK: - Private(set) properties
        private(set) var title: String
        private(set) var subtitle: String
        private(set) var detailViewModel: NationDetailView.ViewModel

        // MARK: - Lifecycle
        init(
            nation: NationData.NationItem,
            historicalItem: Bool = false
        ) {
            if historicalItem {
                if let year = nation.year {
                    title = String(year)
                } else {
                    title = Constants.Text.defaultCellTitle
                }
            } else {
                title = nation.name ?? Constants.Text.defaultCellTitle
            }
            
            let populationPrefix = historicalItem ? Constants.Text.historicalItemPopulationPrefix : Constants.Text.latestItemPopulationPrefix
            
            if let population = nation.population {
                subtitle = populationPrefix + population.formatted()
            } else {
                subtitle = Constants.Text.defaultCellSubtitle
            }
      
            self.detailViewModel = NationDetailView.ViewModel(nation: nation)

        }

    }
}
