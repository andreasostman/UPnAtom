//
//  UniqueServiceName.swift
//
//  Copyright (c) 2015 David Robles
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

@objc public class UniqueServiceName {
    public let uuid, urn: String
    public var rawValue: String {
        if let customRawValue = _customRawValue {
            return customRawValue
        }
        return "\(uuid)::\(urn)"
    }
    init(uuid: String, urn: String, customRawValue: String) {
        self.uuid = uuid
        self.urn = urn
        _customRawValue = customRawValue
    }
    init(uuid: String, urn: String) {
        self.uuid = uuid
        self.urn = urn
    }
    
    private let _customRawValue: String?
}

extension UniqueServiceName: Printable {
    public var description: String {
        return rawValue
    }
}

extension UniqueServiceName: Hashable {
    public var hashValue: Int {
        return uuid.hashValue ^ urn.hashValue
    }
}

public func ==(lhs: UniqueServiceName, rhs: UniqueServiceName) -> Bool {
    return lhs.uuid == rhs.uuid && lhs.urn == rhs.urn
}