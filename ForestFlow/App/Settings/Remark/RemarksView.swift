//
//  RemarkAddView.swift
//  ForestFlow
//
//  Created by Roman Indermühle on 05.01.2024.
//

import SwiftUI
import SwiftData

struct RemarksView: View {

    @Environment(\.modelContext) var context
    
    @State var showModifyView: Bool = false
    @State private var remark: Remark?
    
    // MARK: - Query
    @Query var remarks: [Remark]

    var body: some View {
        List(remarks, id: \.self) { remark in
            Button {
                self.remark = remark
            } label: {
                Text(remark.name)
                    .font(.Bold.title)
            }
            .swipeActions {
                Button(role: .destructive) {
                    context.delete(remark)
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .navigationTitle("Bemerkungen")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PlusButton()
                    .button {
                        showModifyView.toggle()
                    }
            }
        }
        .sheet(item: $remark, onDismiss: { self.remark = nil }) { _ in
            RemarkModifyView(remark: $remark, name: remark?.name ?? "", isEditing: true)
                .presentationDetents([.height(250.0)])
        }
        .sheet(isPresented: $showModifyView) {
            RemarkModifyView(remark: .constant(nil), name: "", isEditing: false)
                .presentationDetents([.height(250.0)])
        }
    }
}


