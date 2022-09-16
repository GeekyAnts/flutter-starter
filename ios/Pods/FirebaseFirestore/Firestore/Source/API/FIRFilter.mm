/*
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FIRFilter+Internal.h"
#import "Firestore/Source/API/FIRFieldPath+Internal.h"

using firebase::firestore::model::FieldPath;
using firebase::firestore::util::MakeString;
using firebase::firestore::core::FieldFilter;

NS_ASSUME_NONNULL_BEGIN

namespace {

FIRFieldPath *MakeFIRFieldPath(NSString *field) {
  return [FIRFieldPath pathWithDotSeparatedString:field];
}

}  // namespace

@interface FIRFilter ()

@property(nonatomic, strong, readwrite) FIRFieldPath *fieldPath;
@property(nonatomic, readwrite) FieldFilter::Operator op;
@property(nonatomic, strong, readwrite) id value;

@end

@implementation FIRFilter

#pragma mark - Constructor Methods

- (instancetype)initWithFIRFieldPath:(nonnull FIRFieldPath *)fieldPath
                                  op:(FieldFilter::Operator)op
                               value:(nonnull id)value {
  if (self = [super init]) {
    self.fieldPath = fieldPath;
    self.op = op;
    self.value = value;
  }
  return self;
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field isEqualTo:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) isEqualTo:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field isEqualTo:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field op:FieldFilter::Operator::Equal value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field isNotEqualTo:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) isNotEqualTo:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field isNotEqualTo:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::NotEqual
                                           value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field isGreaterThan:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) isGreaterThan:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field isGreaterThan:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::GreaterThan
                                           value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field isGreaterThanOrEqualTo:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) isGreaterThanOrEqualTo:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field
             isGreaterThanOrEqualTo:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::GreaterThanOrEqual
                                           value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field isLessThan:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) isLessThan:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field isLessThan:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::LessThan
                                           value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field isLessThanOrEqualTo:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) isLessThanOrEqualTo:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field
                isLessThanOrEqualTo:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::LessThanOrEqual
                                           value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field arrayContains:(nonnull id)value {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) arrayContains:value];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field arrayContains:(nonnull id)value {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::ArrayContains
                                           value:value];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field
               arrayContainsAny:(nonnull NSArray<id> *)values {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) arrayContainsAny:values];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field
                   arrayContainsAny:(nonnull NSArray<id> *)values {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::ArrayContainsAny
                                           value:values];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field in:(nonnull NSArray<id> *)values {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) in:values];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field in:(nonnull NSArray<id> *)values {
  return [[FIRFilter alloc] initWithFIRFieldPath:field op:FieldFilter::Operator::In value:values];
}

+ (FIRFilter *)filterWhereField:(nonnull NSString *)field notIn:(nonnull NSArray<id> *)values {
  return [self filterWhereFieldPath:MakeFIRFieldPath(field) notIn:values];
}

+ (FIRFilter *)filterWhereFieldPath:(nonnull FIRFieldPath *)field
                              notIn:(nonnull NSArray<id> *)values {
  return [[FIRFilter alloc] initWithFIRFieldPath:field
                                              op:FieldFilter::Operator::NotIn
                                           value:values];
}

@end

NS_ASSUME_NONNULL_END
