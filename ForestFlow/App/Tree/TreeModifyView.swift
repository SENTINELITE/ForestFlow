//
//  TreeAddView.swift
//  ForestFlow
//
//  Created by Simon Zwicker on 02.01.24.
//

import SwiftUI
import SwiftData

struct TreeModifyView: View {
    @Query private var remarks: [Remark]
    @Query private var woodTypes: [WoodType]
    @Query private var forestOwners: [ForestOwner]
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @Binding var forest: Forest?
    @Binding var tree: Tree?
    
    @State var rateValue: RateValue?
    @State var woodType: WoodType?
    @State var forestOwner: ForestOwner?
    @State var remark: Remark?
    @State var locationManager: LocationManager = .init()
    
    let isEditing: Bool
    
    var body: some View {
        Form {
            Section("Bauminformationen") {
                
                if woodTypes.isEmpty {
                    ContentUnavailableView(
                        "Noch keine Baumart angelegt",
                        systemImage: "tree.circle.fill" ,
                        description: Text("Erstelle einen neuen Tarif unter Einstellungen -> Baumart")
                    )

                } else {
                    CircleSelection(items: woodTypes, selected: $woodType)
                }
                
                if let rateValues = forest?.rateType?.rateValues?.sorted(by: { $0.stage < $1.stage }) {
                    CircleSelection(items: rateValues, selected: $rateValue)
                }
                if let volume = rateValue?.volume {
                    Text("Volumen: \(volume.string(decimalPlaces: 2))")
                }
                
                
                Picker("Waldbesitzer", selection: $forestOwner) {
                    ForEach(forestOwners, id: \.id) { forestOwner in
                        Text(forestOwner.name)
                            .tag(Optional(forestOwner))
                    }
                }
                
                Picker("Bemerkung", selection: $remark) {
                    ForEach(remarks, id: \.id) { remark in
                        Text(remark.name)
                            .tag(Optional(remark))
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Text("Speichern")
                    .button {
                        self.saveTree()
                    }
                    .disabled(woodTypes.isEmpty)
                
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            locationManager.request()
            
            if isEditing {
                rateValue = tree?.rateValue
                woodType = tree?.woodType
                remark = tree?.remark
                forestOwner = tree?.forestOwner
            }
            
            if rateValue == nil {
                rateValue = forest?.rateType?.rateValues?.last
            }
            
            if woodType == nil {
                woodType = woodTypes.first
            }
            
            if forestOwner == nil {
                forestOwner = forestOwners.first
            }
            
            if remark == nil {
                remark = remarks.first
            }
        }
    }
    
    func saveTree() {
        if isEditing {
            guard let woodType, let remark, let forestOwner else { return }
            tree?.rateValue = rateValue
            tree?.woodType = woodType
            tree?.remark = remark
            tree?.forestOwner = forestOwner
        } else {
            guard let location = locationManager.location, let woodType, let remark, let forestOwner, let forest else { return }
            let tree = Tree(woodType: woodType, rateValue: rateValue, lat: location.latitude, long: location.longitude, forest: forest, remark: remark, forestOwner: forestOwner)
            
            woodType.trees.append(tree)
            remark.trees.append(tree)
            forestOwner.trees.append(tree)
            rateValue?.trees.append(tree)
            forest.trees.append(tree)
        }
        dismiss()
    }
}
