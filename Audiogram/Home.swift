//
// This source file is part of the Audiogram based on the Stanford Spezi Template Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SpeziAccount
import SwiftUI


struct HomeView: View {
    enum Tabs: String {
        case task
        case schedule
        case contact
    }
    
    static var accountEnabled: Bool {
        !FeatureFlags.disableFirebase && !FeatureFlags.skipOnboarding
    }


    @AppStorage(StorageKeys.homeTabSelection) private var selectedTab = Tabs.schedule
    @State private var presentingAccount = false

    
    var body: some View {
        TabView(selection: $selectedTab) {
            AudiometryLaunchView()
                .tag(Tabs.task)
                .tabItem {
                    Label("Audiometry", systemImage: "ear")
                }
//            ScheduleView(presentingAccount: $presentingAccount)
//                .tag(Tabs.schedule)
//                .tabItem {
//                    Label("SCHEDULE_TAB_TITLE", systemImage: "list.clipboard")
//                }
            Contacts(presentingAccount: $presentingAccount)
                .tag(Tabs.contact)
                .tabItem {
                    Label("CONTACTS_TAB_TITLE", systemImage: "person.fill")
                }
        }
            .sheet(isPresented: $presentingAccount) {
                AccountSheet()
            }
            .accountRequired(Self.accountEnabled) {
                AccountSheet()
            }
            .verifyRequiredAccountDetails(Self.accountEnabled)
    }
}


#if DEBUG
#Preview {
    let details = AccountDetails.Builder()
        .set(\.userId, value: "lelandstanford@stanford.edu")
        .set(\.name, value: PersonNameComponents(givenName: "Leland", familyName: "Stanford"))
    
    return HomeView()
        .previewWith(standard: AudiogramStandard()) {
            AudiogramScheduler()
            AccountConfiguration(building: details, active: MockUserIdPasswordAccountService())
        }
}

#Preview {
    CommandLine.arguments.append("--disableFirebase") // make sure the MockWebService is displayed
    return HomeView()
        .previewWith(standard: AudiogramStandard()) {
            AudiogramScheduler()
            AccountConfiguration {
                MockUserIdPasswordAccountService()
            }
        }
}
#endif
