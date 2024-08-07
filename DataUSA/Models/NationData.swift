import Foundation

struct NationData: Decodable {
    
    let data: [NationItem]
    
    struct NationItem: Decodable {
        let id: String?
        let name: String?
        let year: Int?
        let population: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "ID Nation"
            case name = "Nation"
            case year = "ID Year"
            case population = "Population"
        }
    }
}
