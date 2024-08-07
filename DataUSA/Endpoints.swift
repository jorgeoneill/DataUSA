
import Foundation

struct Endpoints {
    static func data(for regionType: RegionType, specificState: String? = nil, historical: Bool = false) -> URL? {
        let yearValue = historical ? Constants.URL.QueryItems.Values.allYears : Constants.URL.QueryItems.Values.latestYear
        var drilldwonValue = ""
        
        switch regionType {
        case .nation:
            drilldwonValue = Constants.URL.QueryItems.Values.nationDrilldown
        case .states:
            drilldwonValue = Constants.URL.QueryItems.Values.stateDrilldown
        }
        
        var queryItems = [
            URLQueryItem(
                name: Constants.URL.QueryItems.Names.drilldowns,
                value: drilldwonValue
            ),
            URLQueryItem(
                name: Constants.URL.QueryItems.Names.measures,
                value: Constants.URL.QueryItems.Values.defaultMeasure
            ),
            URLQueryItem(
                name: Constants.URL.QueryItems.Names.year,
                value: yearValue
            )
        ]
        
        if let specificState {
            queryItems.append(URLQueryItem(
                name: Constants.URL.QueryItems.Names.state,
                value: specificState)
            )
        }

        var components = URLComponents()
        components.scheme = Constants.URL.scheme
        components.host = Constants.URL.host
        components.path = Constants.URL.path
        components.queryItems = queryItems
        return components.url
    
    }
    
    enum RegionType {
        case nation
        case states
    }

}
