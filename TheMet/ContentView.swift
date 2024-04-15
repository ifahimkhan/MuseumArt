import SwiftUI

struct ContentView: View {
  @StateObject private var store = TheMetStore()
  var body: some View {

    List(store.objects, id: \.objectID){
      object in
      Text(object.title)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
