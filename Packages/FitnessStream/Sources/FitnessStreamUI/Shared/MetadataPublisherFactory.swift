//
// MetadataPublisherFactory.swift
// Copyright © 2022 Bright Digit, LLC.
// All Rights Reserved.
// Created by Leo G Dion.
//

#if canImport(Combine)
  import Combine
  import Foundation
import FitnessStream

public struct MetadataPublisherFactory: MetadataPublicist {
  public func publisher<FullIdentifierPublisher, WorkoutPublisher, IdentifierType>(withId idPublisher: FullIdentifierPublisher, forWorkout workoutPublisher: WorkoutPublisher) -> AnyPublisher<Error?, Never> where FullIdentifierPublisher : Publisher, WorkoutPublisher : Publisher, FullIdentifierPublisher.Failure == Never, FullIdentifierPublisher.Output == IdentifierType?, WorkoutPublisher.Failure == Never, WorkoutPublisher.Output == WorkoutStream? {
          idPublisher.combineLatest(workoutPublisher).compactMap { args in
            args.0.flatMap { fullId in
    
              args.1.map { workout in
                (fullId, workout)
              }
            }
          }.flatMap { args in
            Future { completion in
              args.1.setFullIdentifier(args.0) {
                completion(.success($0))
              }
            }
          }.eraseToAnyPublisher()
  }
  
    public init() {}
//    public func publisher<FullIdentifierPublisher: Publisher, WorkoutPublisher: Publisher>(
//      withId idPublisher: FullIdentifierPublisher,
//      forWorkout workoutPublisher: WorkoutPublisher
//    ) -> AnyPublisher<Error?, Never> where
//      FullIdentifierPublisher.Output == UUID?,
//      FullIdentifierPublisher.Failure == Never,
//      WorkoutPublisher.Output == WorkoutStream?,
//      WorkoutPublisher.Failure == Never {
//      idPublisher.combineLatest(workoutPublisher).compactMap { args in
//        args.0.flatMap { fullId in
//
//          args.1.map { workout in
//            (fullId, workout)
//          }
//        }
//      }.flatMap { args in
//        Future { completion in
//          args.1.setFullIdentifier(args.0) {
//            completion(.success($0))
//          }
//        }
//      }.eraseToAnyPublisher()
//    }
  }
#endif
