//
//  ContentView.swift
//  emergency caller
//
//  Created by 黄家骏 on 5/18/23.
//


import SwiftUI
import DynamicColor

struct SizingView: View {
    @State private var showPersonalInfo = false // State variable to track whether to show the personal info view

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(DynamicColor.systemRed))
                        .frame(maxWidth: 200, maxHeight: 150)
                    VStack {
                        Text("SOS")
                    }
                }
                .onTapGesture {
                    // Handle tap on SOS stack here
                    // You can add your logic or navigation code if needed
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(DynamicColor.green))
                        .frame(maxWidth: 200, maxHeight: 150)
                    VStack {
                        Text("Personal Information")
                    }
                }
                .onTapGesture {
                    // Handle tap on Personal Information stack here
                    showPersonalInfo = true // Set the state variable to true to trigger navigation
                }
            }
            .font(.headline)
            .navigationBarTitle("Main Menu")
            .sheet(isPresented: $showPersonalInfo) {
                PersonalInfoView() // Present the PersonalInfoView as a sheet when showPersonalInfo is true
            }
        }
    }
}

struct PersonalInfoView: View {
    @Environment(\.presentationMode) private var presentationMode // Environment variable to dismiss the sheet

    var body: some View {
        VStack {
            Text("Enter Personal Information")
                .font(.headline)
                .padding()
            
            // Add your personal information input fields here
            
            Button("Save") {
                // Handle the save action here
                
                presentationMode.wrappedValue.dismiss() // Dismiss the sheet
            }
            .padding()
        }
        .navigationBarTitle("Personal Information")
    }
}

struct Previews_SizingView_Previews: PreviewProvider {
    static var previews: some View {
        SizingView()
    }
}
