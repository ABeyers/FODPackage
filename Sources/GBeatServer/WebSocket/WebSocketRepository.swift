//
// WebSocketRepository.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

import NIO
import Redis
import RediStack
import Vapor

class WebSocketRepository {
  unowned var app: Application!
  private var webSockets = [Int: [WebSocket]]()
  private var isListening = false
  private let lock = NSLock()

  init(app: Application) {
    self.app = app
  }

  func setupRedis() {
    if isListening {
      return
    }

    isListening = true

    subscribe()
  }

  private func subscribe() {
    app.redis.psubscribe(to: "*") { publisher, message in
      self.lock.lock()
      defer { self.lock.unlock() }
      guard
        let group = Int(publisher.rawValue),
        let websockets = self.webSockets[group],
        let text = message.string
      else {
        return
      }

      for websocket in websockets {
        websocket.send(text)
      }
    } onSubscribe: { _, _ in

    } onUnsubscribe: { _, _ in
      self.subscribe()
    }
  }

  func save(_ webSocket: WebSocket, withID id: Int) {
    lock.lock()
    defer { lock.unlock() }
    setupRedis()

    let result: [WebSocket]
    if var arr = webSockets[id] {
      arr.append(webSocket)
      result = arr
    } else {
      result = [webSocket]
    }
    webSockets[id] = result
    webSocket.onClose.whenComplete { _ in
      if var webSockets = self.webSockets[id] {
        webSockets.removeAll { $0 === webSocket }
        if webSockets.isEmpty {
          self.webSockets[id] = nil
        } else {
          self.webSockets[id] = webSockets
        }
      }
    }
  }

  func sendText(_ text: String, toWebSocketId id: Int) -> Bool {
    lock.lock()
    defer { lock.unlock() }
    setupRedis()
    if let group = webSockets[id] {
      for websocket in group {
        websocket.send(text)
      }
    }

    app.redis.publish(text, to: RedisChannelName(String(id)))
    return true
  }
}
