import Foundation

class TheMetStore: ObservableObject {
  @Published var objects: [Object] = []
  let service = TheMetService()
  let maxIndex: Int

  init(_ maxIndex: Int = 30) {
    self.maxIndex = maxIndex
  }

  func fetchObjects(for queryTerm: String) async throws {
    if let objectIDs = try await service.getObjectIDs(from: queryTerm) {  // 1
      for (index, objectID) in objectIDs.objectIDs.enumerated()  // 2
      where index < maxIndex {
        if let object = try await service.getObject(from: objectID) {
          await MainActor.run {
            objects.append(object)
          }
        }
      }
    }
  }
}
