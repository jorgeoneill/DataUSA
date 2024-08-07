import Foundation

struct StateData: Decodable {
    
    let data: [StateItem]
    
    struct StateItem: Decodable {
        let id: String?
        let name: String?
        let year: Int?
        let population: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "ID State"
            case name = "State"
            case year = "ID Year"
            case population = "Population"
        }
    }
    
}
