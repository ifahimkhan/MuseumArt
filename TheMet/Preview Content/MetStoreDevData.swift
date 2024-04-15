import Foundation

extension TheMetStore {
  func createDevData() {
    objects = [
      Object(
        objectID: 452174,
        title: "Bahram Gur Slays the Rhino-Wolf",
        creditLine: "Gift of Arthur A. Houghton Jr., 1970",
        objectURL: "https://www.metmuseum.org/art/collection/search/452174",
        isPublicDomain: true,
        primaryImageSmall: "https://images.metmuseum.org/CRDImages/is/original/DP107178.jpg"),
      Object(
        objectID: 241715,
        title: "Terracotta oil lamp",
        creditLine: "The Cesnola Collection, Purchased by subscription, 1874–76",
        objectURL: "https://www.metmuseum.org/art/collection/search/241715",
        isPublicDomain: false,
        primaryImageSmall: ""),
      Object(
        objectID: 452648,
        title: "Gushtasp Slays the Rhino-Wolf",
        creditLine: "Bequest of Monroe C. Gutman, 1974",
        objectURL: "https://www.metmuseum.org/art/collection/search/452648",
        isPublicDomain: true,
        primaryImageSmall: "https://images.metmuseum.org/CRDImages/is/web-large/DP108572.jpg")
    ]
  }
}
