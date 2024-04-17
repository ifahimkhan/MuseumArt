
import Foundation

struct Object: Codable, Hashable {
  let objectID: Int
  let title: String
  let creditLine: String
  let objectURL: String
  let isPublicDomain: Bool
  let primaryImageSmall: String
}

struct ObjectIDs: Codable {
  let total: Int
  let objectIDs: [Int]
}

extension Object {
  static func sample(isPublicDomain: Bool) -> Object {
    if isPublicDomain {
      return Object(
        objectID: 452174,
        title: "Bahram Gur Slays the Rhino-Wolf",
        creditLine: "Gift of Arthur A. Houghton Jr., 1970",
        objectURL: "https://www.metmuseum.org/art/collection/search/452174",
        isPublicDomain: true,
        primaryImageSmall: "https://images.metmuseum.org/CRDImages/is/original/DP107178.jpg")
        } else {
          return Object(
            objectID: 828444,
            title: "Hexagonal flower vase",
            creditLine: "Gift of Samuel and Gabrielle Lurie, 2019",
            objectURL: "https://www.metmuseum.org/art/collection/search/828444",
            isPublicDomain: false,
            primaryImageSmall: "")

        }
        }
}
