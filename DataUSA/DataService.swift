import Foundation

// NOTE: In a real more robust solution a cache or data persistance mechanism should be devised, to aviod unnecessary requests.
class DataService {
    static func fetchStateData(historical: Bool = false, specificState: String? = nil) async throws -> [StateData.StateItem] {
        guard let url = Endpoints.data(for: .states, specificState: specificState, historical: historical) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }

        let stateItems = try JSONDecoder().decode(
            StateData.self,
            from: data
        ).data
        return stateItems
    }
    
    static func fetchNationData(historical: Bool = false) async throws -> [NationData.NationItem] {
        guard let url = Endpoints.data(for: .nation, historical: historical) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidServerResponse
        }

        let nationItems = try JSONDecoder().decode(
            NationData.self,
            from: data
        ).data
        return nationItems
    }
    
    static func generateLatestStateData() -> [StateData.StateItem] {
        let data = [
            StateData.StateItem(
                id: "04000US01",
                name: "Alabama",
                year: 2022,
                population: 5028092
            ),
            StateData.StateItem(
                id: "04000US02",
                name: "Alaska",
                year: 2022,
                population: 734821
            ),
            StateData.StateItem(
                id: "04000US04",
                name: "Arizona",
                year: 2022,
                population: 7172282
            )
        ]
        return data
    }
    
    static func generateLatestNationData() -> [NationData.NationItem] {
        let data = [
            NationData.NationItem(
                id: "01000US",
                name: "United States",
                year: 2022,
                population: 331097593
            )
        ]
        return data
    }
}
