//
// This source file is part of the Audiogram based on the Stanford Spezi Template Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

@testable import Audiogram
import XCTest


class AudiogramTests: XCTestCase {
    func testContactsCount() throws {
        XCTAssertEqual(Contacts(presentingAccount: .constant(true)).contacts.count, 1)
    }
}
