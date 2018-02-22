//
//  UIView+Xib.m
//  Pods
//
//  Created by Martín Fernández on 11/19/14.
//
//

#import "UIView+Xib.h"

@implementation UIView (Xib)

- (instancetype)initFromXib
{
  return [self initFromXibWithName:NSStringFromClass(self.class)];
}

- (instancetype)initFromXibWithName:(NSString *)name
{
  return [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
  if (!self.shouldLoadFromXib) { return self; }

  if (![self.subviews count]) {
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSArray *loadedViews = [mainBundle loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil];
    UIView *loadedView = [loadedViews firstObject];

    loadedView.frame = self.frame;
    loadedView.autoresizingMask = self.autoresizingMask;
    loadedView.translatesAutoresizingMaskIntoConstraints =
    self.translatesAutoresizingMaskIntoConstraints;

    for (NSLayoutConstraint *constraint in self.constraints)
    {
      id firstItem = constraint.firstItem;
      if (firstItem == self)
      {
        firstItem = loadedView;
      }
      id secondItem = constraint.secondItem;
      if (secondItem == self)
      {
        secondItem = loadedView;
      }
      [loadedView addConstraint:
       [NSLayoutConstraint constraintWithItem:firstItem
                                    attribute:constraint.firstAttribute
                                    relatedBy:constraint.relation
                                       toItem:secondItem
                                    attribute:constraint.secondAttribute
                                   multiplier:constraint.multiplier
                                     constant:constraint.constant]];
    }

    return loadedView;
  }
  return self;
}

- (BOOL)shouldLoadFromXib
{
  return NO;
}

@end
