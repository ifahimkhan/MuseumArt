import SwiftUI

struct ContentView: View {
  @StateObject private var store = TheMetStore()
  @State private var fetchObjectsTask: Task<Void, Error>?
  @State private var query = "rhino"
  @State private var showQueryField = false
  var body: some View {

    NavigationStack {
      VStack {
        Text("You searched for \(query)")
          .padding()
          .background(Color.metForeground)
          .cornerRadius(10)
        List(store.objects, id: \.objectID){
          object in
          if object.isPublicDomain{
            let url = URL(string: object.objectURL)!
            NavigationLink(value:url)
            {
              WebIndicatorView(title: object.title)
            }
            .listRowBackground(Color.metForeground)
            //          .foregroundColor(.white)
          }else{
            NavigationLink(object.title){
              ObjectView(object:object)
            } .listRowBackground(Color.metBackground)
              .foregroundColor(.white)
          }

          //        Link(object.title, destination: URL(string: object.objectURL)!)

          //
        }
        .navigationTitle("Museum Art")
        .toolbar{
          Button("Search Art"){
            query=""
            showQueryField = true
          }
          .foregroundColor(Color.metBackground)
          .padding(.horizontal)
          .background(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.metBackground,lineWidth: 1))

        }
        .alert("Search the Art", isPresented: $showQueryField) {
          TextField("Search the Art", text: $query)
          Button("Search") {
            fetchObjectsTask?.cancel()
           fetchObjectsTask = Task { do {
              store.objects = []
              try await store.fetchObjects(for: query)
            } catch {}

            }
          }
        }

        .navigationDestination(for: URL.self) { url in
          SafariView(url: url)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
        }
        .navigationDestination(for: Object.self) { object in
          ObjectView(object: object)
        }
      }
      .overlay {
       if store.objects.isEmpty { ProgressView() }
     }
    }
    .task { do {
      try await store.fetchObjects(for: query)
    } catch {}
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WebIndicatorView: View {
  let title:String
  var body: some View {
    HStack {
      Text(title)
      Spacer()
      Image(systemName: "rectangle.portrait.and.arrow.right.fill")
        .font(.footnote)
    }
  }
}
