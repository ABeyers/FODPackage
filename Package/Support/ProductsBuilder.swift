//
// ProductsBuilder.swift
// Copyright © 2023 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

@resultBuilder
enum ProductsBuilder {
  static func buildPartialBlock(first: Product) -> [Product] {
    [first]
  }

  static func buildPartialBlock(accumulated: [Product], next: Product) -> [Product] {
    accumulated + [next]
  }
}
