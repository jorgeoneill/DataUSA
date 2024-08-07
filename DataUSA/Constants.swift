import SwiftUI

enum Constants {
    enum URL {
        static let scheme = "https"
        static let host = "datausa.io"
        static let path = "/api/data"

        enum QueryItems {
            enum Names {
                static let drilldowns = "drilldowns"
                static let measures = "measures"
                static let year = "year"
                static let state = "State"
            }
            enum Values {
                static let stateDrilldown = "State"
                static let nationDrilldown = "Nation"
                static let defaultMeasure = "Population"
                static let latestYear = "latest"
                static let allYears = "all"
            }
        }
    }
    
    enum Text {
        static let emptyViewTitle = "Loading data..."
        static let numberOfStatesLabel = "Number of states: "
        static let numberOfEntriesLabel = "Number of entries: "
        static let defaultNavigationTitle = "Population"
        static let defaultCellTitle = "No data"
        static let defaultCellSubtitle = "No data"
        static let historicalItemPopulationPrefix = "Total population: "
        static let latestItemPopulationPrefix = "Current population: "
        static let nationSectionHeader = "Nation"
        static let stateSectionHeader = "State"
        static let okButtonTitle = "Ok"
    }
    
    enum UI {
        static let regularFontOpacity = 0.8
        static let lightFontOpacity = 0.5
    }
}
