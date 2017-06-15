// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tensorflow/contrib/mpi/mpi_msg.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Tensorflow_MPIRecvTensorResponse: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".MPIRecvTensorResponse"

  public var response: Tensorflow_RecvTensorResponse {
    get {return _storage._response ?? Tensorflow_RecvTensorResponse()}
    set {_uniqueStorage()._response = newValue}
  }
  /// Returns true if `response` has been explicitly set.
  public var hasResponse: Bool {return _storage._response != nil}
  /// Clears the value of `response`. Subsequent reads from it will return its default value.
  public mutating func clearResponse() {_storage._response = nil}

  public var singleSend: Bool {
    get {return _storage._singleSend}
    set {_uniqueStorage()._singleSend = newValue}
  }

  public var key: String {
    get {return _storage._key}
    set {_uniqueStorage()._key = newValue}
  }

  public var stepID: Int64 {
    get {return _storage._stepID}
    set {_uniqueStorage()._stepID = newValue}
  }

  public var checksum: UInt64 {
    get {return _storage._checksum}
    set {_uniqueStorage()._checksum = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._response)
        case 2: try decoder.decodeSingularBoolField(value: &_storage._singleSend)
        case 3: try decoder.decodeSingularStringField(value: &_storage._key)
        case 4: try decoder.decodeSingularInt64Field(value: &_storage._stepID)
        case 5: try decoder.decodeSingularUInt64Field(value: &_storage._checksum)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._response {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._singleSend != false {
        try visitor.visitSingularBoolField(value: _storage._singleSend, fieldNumber: 2)
      }
      if !_storage._key.isEmpty {
        try visitor.visitSingularStringField(value: _storage._key, fieldNumber: 3)
      }
      if _storage._stepID != 0 {
        try visitor.visitSingularInt64Field(value: _storage._stepID, fieldNumber: 4)
      }
      if _storage._checksum != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._checksum, fieldNumber: 5)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tensorflow"

extension Tensorflow_MPIRecvTensorResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "response"),
    2: .same(proto: "singleSend"),
    3: .same(proto: "key"),
    4: .standard(proto: "step_id"),
    5: .same(proto: "checksum"),
  ]

  fileprivate class _StorageClass {
    var _response: Tensorflow_RecvTensorResponse? = nil
    var _singleSend: Bool = false
    var _key: String = String()
    var _stepID: Int64 = 0
    var _checksum: UInt64 = 0

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _response = source._response
      _singleSend = source._singleSend
      _key = source._key
      _stepID = source._stepID
      _checksum = source._checksum
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Tensorflow_MPIRecvTensorResponse) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_storage, other_storage) in
        if _storage._response != other_storage._response {return false}
        if _storage._singleSend != other_storage._singleSend {return false}
        if _storage._key != other_storage._key {return false}
        if _storage._stepID != other_storage._stepID {return false}
        if _storage._checksum != other_storage._checksum {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}