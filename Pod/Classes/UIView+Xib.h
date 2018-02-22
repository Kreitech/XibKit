//
//  UIView+Xib.h
//  Pods
//
//  Created by Martín Fernández on 11/19/14.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Xib)

/**
 *  Intializes a new view from a xib file with the same name the class has.
 *
 *  @return The new view
 */
- (instancetype)initFromXib;

/**
 *  Intializes a new view from a xib file with the given name;
 *
 *  @param name The xib name
 *
 *  @return The new view
 */
- (instancetype)initFromXibWithName:(NSString *)name;

/**
 *  Return YES if you wan't to load the content of the xib when the view is
 *  initialized from a storyboard.
 *
 *  This methods should be overriden by any UIView
 *
 *  @return YES if need's to loads the xib
 */
- (BOOL)shouldLoadFromXib;

@end
