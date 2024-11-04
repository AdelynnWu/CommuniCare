//
//  PickerComponents.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 9/10/24.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var option: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(option)
                Spacer()
                if self.isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
        }
    }
}

struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionRow(option: "", isSelected: false) {
            
        }
    }
}

