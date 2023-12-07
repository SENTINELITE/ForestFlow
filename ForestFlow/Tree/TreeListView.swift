//
//  TreeListView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 20.05.23.
//

import SwiftUI
import SwiftData

struct TreeListView: View {
    
    @State private var showAddTreeView = false
    @State private var showInfoList = false
    
    @Environment(\.modelContext) private var modelContext
    @Query private var treeElements: [TreeElement]
    
    let listName: String
    
    init(listName: String) {
        self.listName = listName
    }
    
    var body: some View {
        List {
            ForEach(treeElements, id: \.self) { tree in
                NavigationLink(destination: TreeDetailView()) {
                    VStack(alignment: .leading) {
                        VStack {
                            Text(tree.woodType)
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Text("Stufe: 2")
                            Spacer()
                            Text("\(tree.stage, specifier: "%.2f")m3")
                        }
                    }
                }
                .contextMenu {
                    Button(role: .destructive) {
                        modelContext.delete(tree)
                        try? modelContext.save()
                    } label: {
                        Label("Baum löschen", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .navigationTitle(listName)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        showInfoList.toggle()
                        print("Info button tapped")
                    } label: {
                        Label("Infos zur Liste anzeigen", systemImage: "info.circle")
                    }
                    Button {
                        print("Export button tapped")
                    } label: {
                        Label("Liste exportieren", systemImage: "arrow.up.doc")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
                Button {
                    showAddTreeView.toggle()
                    print("Plus button tapped")
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddTreeView) {
            AddTreeView()
        }
        .sheet(isPresented: $showInfoList) {
            ListDetailView()
                .presentationDetents([.fraction(0.30)])
        }
    }
}


#Preview("TreeListView") {
    NavigationView {
        TreeListView(listName: "Example")
            .modelContainer(for: TreeElement.self)
    }
}
