// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tensorflow/contrib/mpi_collectives/mpi_message.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2016 The TensorFlow Authors. All Rights Reserved.
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//==============================================================================

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

/// An MPIRequest is a message sent from a rank greater than zero to the
/// coordinator (rank zero), informing the coordinator of an operation that
/// the rank wants to do and the tensor that it wants to apply the operation to.
public struct Tensorflow_Contrib_Mpi_MPIRequest: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".MPIRequest"

  /// The request rank is necessary to create a consistent ordering of results,
  /// for example in the allgather where the order of outputs should be sorted
  /// by rank.
  public var requestRank: Int32 {
    get {return _storage._requestRank}
    set {_uniqueStorage()._requestRank = newValue}
  }

  public var requestType: Tensorflow_Contrib_Mpi_MPIRequest.RequestType {
    get {return _storage._requestType}
    set {_uniqueStorage()._requestType = newValue}
  }

  public var tensorType: Tensorflow_DataType {
    get {return _storage._tensorType}
    set {_uniqueStorage()._tensorType = newValue}
  }

  public var tensorName: String {
    get {return _storage._tensorName}
    set {_uniqueStorage()._tensorName = newValue}
  }

  public var tensorShape: Tensorflow_TensorShapeProto {
    get {return _storage._tensorShape ?? Tensorflow_TensorShapeProto()}
    set {_uniqueStorage()._tensorShape = newValue}
  }
  /// Returns true if `tensorShape` has been explicitly set.
  public var hasTensorShape: Bool {return _storage._tensorShape != nil}
  /// Clears the value of `tensorShape`. Subsequent reads from it will return its default value.
  public mutating func clearTensorShape() {_storage._tensorShape = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum RequestType: SwiftProtobuf.Enum {
    public typealias RawValue = Int
    case allreduce // = 0
    case allgather // = 1
    case UNRECOGNIZED(Int)

    public init() {
      self = .allreduce
    }

    public init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .allreduce
      case 1: self = .allgather
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    public var rawValue: Int {
      switch self {
      case .allreduce: return 0
      case .allgather: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

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
        case 1: try decoder.decodeSingularInt32Field(value: &_storage._requestRank)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._requestType)
        case 3: try decoder.decodeSingularEnumField(value: &_storage._tensorType)
        case 4: try decoder.decodeSingularStringField(value: &_storage._tensorName)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._tensorShape)
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
      if _storage._requestRank != 0 {
        try visitor.visitSingularInt32Field(value: _storage._requestRank, fieldNumber: 1)
      }
      if _storage._requestType != .allreduce {
        try visitor.visitSingularEnumField(value: _storage._requestType, fieldNumber: 2)
      }
      if _storage._tensorType != .dtInvalid {
        try visitor.visitSingularEnumField(value: _storage._tensorType, fieldNumber: 3)
      }
      if !_storage._tensorName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._tensorName, fieldNumber: 4)
      }
      if let v = _storage._tensorShape {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// An MPIResponse is a message sent from the coordinator (rank zero) to a rank
/// greater than zero, informing the rank of an operation should be performed
/// now. If the operation requested would result in an error (for example, due
/// to a type or shape mismatch), then the MPIResponse can contain an error and
/// an error message instead. Finally, an MPIResponse can be a DONE message (if
/// there are no more tensors to reduce on this tick of the background loop) or
/// SHUTDOWN if all MPI processes should shut down.
public struct Tensorflow_Contrib_Mpi_MPIResponse: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".MPIResponse"

  /// Empty if the type is DONE or SHUTDOWN.
  public var responseType: Tensorflow_Contrib_Mpi_MPIResponse.ResponseType = .allreduce

  public var tensorName: String = String()

  /// Empty unless response_type is ERROR.
  public var errorMessage: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum ResponseType: SwiftProtobuf.Enum {
    public typealias RawValue = Int
    case allreduce // = 0
    case allgather // = 1
    case error // = 2
    case done // = 3
    case shutdown // = 4
    case UNRECOGNIZED(Int)

    public init() {
      self = .allreduce
    }

    public init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .allreduce
      case 1: self = .allgather
      case 2: self = .error
      case 3: self = .done
      case 4: self = .shutdown
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    public var rawValue: Int {
      switch self {
      case .allreduce: return 0
      case .allgather: return 1
      case .error: return 2
      case .done: return 3
      case .shutdown: return 4
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.responseType)
      case 2: try decoder.decodeSingularStringField(value: &self.tensorName)
      case 3: try decoder.decodeSingularStringField(value: &self.errorMessage)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.responseType != .allreduce {
      try visitor.visitSingularEnumField(value: self.responseType, fieldNumber: 1)
    }
    if !self.tensorName.isEmpty {
      try visitor.visitSingularStringField(value: self.tensorName, fieldNumber: 2)
    }
    if !self.errorMessage.isEmpty {
      try visitor.visitSingularStringField(value: self.errorMessage, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tensorflow.contrib.mpi"

extension Tensorflow_Contrib_Mpi_MPIRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "request_rank"),
    2: .standard(proto: "request_type"),
    3: .standard(proto: "tensor_type"),
    4: .standard(proto: "tensor_name"),
    5: .standard(proto: "tensor_shape"),
  ]

  fileprivate class _StorageClass {
    var _requestRank: Int32 = 0
    var _requestType: Tensorflow_Contrib_Mpi_MPIRequest.RequestType = .allreduce
    var _tensorType: Tensorflow_DataType = .dtInvalid
    var _tensorName: String = String()
    var _tensorShape: Tensorflow_TensorShapeProto? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _requestRank = source._requestRank
      _requestType = source._requestType
      _tensorType = source._tensorType
      _tensorName = source._tensorName
      _tensorShape = source._tensorShape
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Tensorflow_Contrib_Mpi_MPIRequest) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._requestRank != other_storage._requestRank {return false}
        if _storage._requestType != other_storage._requestType {return false}
        if _storage._tensorType != other_storage._tensorType {return false}
        if _storage._tensorName != other_storage._tensorName {return false}
        if _storage._tensorShape != other_storage._tensorShape {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Tensorflow_Contrib_Mpi_MPIRequest.RequestType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ALLREDUCE"),
    1: .same(proto: "ALLGATHER"),
  ]
}

extension Tensorflow_Contrib_Mpi_MPIResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "response_type"),
    2: .standard(proto: "tensor_name"),
    3: .standard(proto: "error_message"),
  ]

  public func _protobuf_generated_isEqualTo(other: Tensorflow_Contrib_Mpi_MPIResponse) -> Bool {
    if self.responseType != other.responseType {return false}
    if self.tensorName != other.tensorName {return false}
    if self.errorMessage != other.errorMessage {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Tensorflow_Contrib_Mpi_MPIResponse.ResponseType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ALLREDUCE"),
    1: .same(proto: "ALLGATHER"),
    2: .same(proto: "ERROR"),
    3: .same(proto: "DONE"),
    4: .same(proto: "SHUTDOWN"),
  ]
}