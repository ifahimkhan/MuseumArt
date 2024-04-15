import Foundation

class TheMetStore: ObservableObject {
  @Published var objects: [Object] = []

  init() {
    #if DEBUG
    createDevData()
    #endif
  }
}
