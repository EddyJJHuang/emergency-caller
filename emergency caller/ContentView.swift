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




//personal info stack
struct PersonalInfoView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var birthdate = Date()
    
    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let currentDate = Date()
        let startDate = calendar.date(byAdding: .year, value: -100, to: currentDate)!
        let endDate = currentDate
        return startDate...endDate
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Personal Information").font(.headline)) {
                    TextField("Name", text: $name)
                    TextField("Phone Number", text: $phone)
                }
                
                Section(header: Text("Birthdate").font(.headline)) {
                    ScrollView(.horizontal) {
                        HStack {
                            Spacer()
                            DatePicker("", selection: $birthdate, in: dateRange, displayedComponents: [.date])
                                .datePickerStyle(WheelDatePickerStyle())
                                .frame(width: 250) // Adjust the width as needed
                            Spacer()
                        }
                    }
                }
                
                Section {
                    Button("Save") {
                        savePersonalInfo()
                    }
                }
            }
            .navigationBarTitle("Personal Information")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func savePersonalInfo() {
        // Here you can perform the necessary actions to save the user's personal information
        // For example, you could store the values in a database or update a user profile
        
        // After saving, dismiss the view
        presentationMode.wrappedValue.dismiss()
    }
}



struct Previews_SizingView_Previews: PreviewProvider {
    static var previews: some View {
        SizingView()
    }
}


