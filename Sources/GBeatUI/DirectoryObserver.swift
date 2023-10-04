//
// DirectoryObserver.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine) && targetEnvironment(simulator)

  import Combine
  import Foundation
  import System
  class DirectoryObserver {
    public let directoryPath: FilePath

    private var dispatchSource: DispatchSourceFileSystemObject?
    private var descriptor: FileDescriptor?

    let fileWriteSubject = PassthroughSubject<Void, Never>()

    func onFileWrite() {
      fileWriteSubject.send()
    }

    init(directoryPath: String) {
      Self.logger.debug("Will Watch: \(directoryPath)")
      self.directoryPath = FilePath(directoryPath)
    }

    func cancelHandler() {
      try? descriptor?.close()
      dispatchSource = nil
      descriptor = nil
    }

    func stopMonitoring() {
      dispatchSource?.cancel()
    }

    func startMonitoring(triggerImmediately: Bool) throws {
      let descriptor = try FileDescriptor.open(directoryPath, .init(rawValue: O_EVTONLY))

      let source = DispatchSource.makeFileSystemObjectSource(fileDescriptor: descriptor.rawValue, eventMask: .write, queue: .global(qos: .userInteractive))

      source.setCancelHandler(handler: cancelHandler)
      source.setEventHandler(handler: onFileWrite)

      self.descriptor = descriptor
      dispatchSource = source

      source.resume()

      if triggerImmediately {
        onFileWrite()
      }
    }

    func directoryEventPublisher() -> AnyPublisher<Void, Never> {
      fileWriteSubject.eraseToAnyPublisher()
    }
  }

  import FelinePine
  import FitnessStream

  extension DirectoryObserver: LoggerCategorized {
    typealias LoggersType = HeartwitchLoggers

    static var loggingCategory: LoggerCategory {
      .reactive
    }
  }
#endif
