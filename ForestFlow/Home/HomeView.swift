//
//  EntryListView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 20.05.23.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    @State private var showSettings = false
    @State private var showAddList = false
    @State private var showAddTree = false
    @State private var showInfo = false
    
    @Environment(\.modelContext) private var modelContext
    @Query private var listElements: [ListElement]
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listElements, id: \.self) { item in
                    NavigationLink(destination: TreeListView(listName: item.name)) {
                        ItemView(itemName: item.name)
                    }.contextMenu {
                        Button {
                            showInfo.toggle()
                        } label: {
                            Label("Infos zur Liste anzeigen", systemImage: "info.circle")
                        }
                        Button {
                            showAddList.toggle()
                        } label: {
                            Label("Liste bearbeiten", systemImage: "pencil")
                        }
                        Button(role: .destructive) {
                            modelContext.delete(item)
                            try? modelContext.save()
                        } label: {
                            Label("Liste löschen", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Listen")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { showSettings.toggle() }) {
                        Label("Einstellungen", systemImage: "gear")
                    }
                    Menu {
                        Button(action: { showAddList.toggle() }) {
                            Label("Neue Liste", systemImage: "list.bullet.clipboard")
                        }
                        Button(action: { showAddTree.toggle() }) {
                            Label("Neuer Baum", systemImage: "square.and.pencil")
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddTree, content: {
                        AddTreeView()
                    })
                    .sheet(isPresented: $showAddList) {
                        AddListView()
                    }
                    .sheet(isPresented: $showInfo) {
                        ListDetailView()
                            .presentationDetents([.fraction(0.30)])
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                    }
                    
                }
            }
        }
    }
}

#Preview("ListView") {
    HomeView()
        .modelContainer(for: ListElement.self)
}

