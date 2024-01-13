//
//  TreeAddView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct TreeAddView: View {
    @Query private var remarks: [Remark]
    @Query private var woodTypes: [WoodType]
    @Query private var forestOwners: [ForestOwner]

    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @Bindable var forest: Forest

    @State var rateType: RateType?
    @State var woodType: WoodType?
    @State var stage: Int = 1
    @State var forestOwner: ForestOwner?
    @State var remark: Remark?
    @State var locationManager: LocationManager = .init()

    var body: some View {
        VStack {
            Form {
                Section("Bauminformationen") {
                    CircleSelection(items: woodTypes, selected: $woodType)
                    
                    Picker("Waldbesitzer", selection: $forestOwner) {
                        ForEach(forestOwners, id: \.id) { forestOwner in
                            Text(forestOwner.name)
                        }
                    }
                    
                    Picker("Bemerkung", selection: $remark) {
                        ForEach(remarks, id: \.id) { remark in
                            Text(remark.name)
                        }
                    }
                }
            }

            Spacer()

            Text("Hinzufügen")
                .font(.Bold.title2)
                .foregroundStyle(Color.accentColor)
                .padding()
                .button {
                    self.saveTree()
                }
        }
        .onAppear {
            locationManager.request()
        }
    }

    func saveTree() {
        guard let location = locationManager.location, let woodType else { return }
        let tree = Tree(woodType: woodType, stage: stage, lat: location.latitude, long: location.longitude, forest: forest)
        context.insert(forest)
        forest.trees.append(tree)
        dismiss()
    }
}
