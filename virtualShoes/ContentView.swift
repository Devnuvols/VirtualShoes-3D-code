//
//  ContentView.swift
//  virtualShoes
//
//  Created by Miguel Monllau on 20/8/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @State var shoesVM  = ShoesViewModel()
    @State private var selectedShoe: ShoeModel?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedShoe){
                ForEach(shoesVM.shoes) { shoe in Text(shoe.name)
                        .tag(shoe)
                    
                }
            }
            .navigationTitle("Zapatos")
            .navigationSplitViewColumnWidth(200)
        } content: {
            if let selectedShoe {
                Text(selectedShoe.name)
                //shoeDetail(selectedShoe: selectedShoe)
            } else {
                Text("Seleccionar un zapato de la lista")
            }
        } detail: {
            
        }
        .alert("App error",
               isPresented: $shoesVM.showAlert) {} message: {
            Text(shoesVM.errorMsg)
        }
        
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
