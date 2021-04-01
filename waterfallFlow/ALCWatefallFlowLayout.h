//
//  ALCWatefallFlowLayout.h
//  waterfallFlow
//
//  Created by 杨柳 on 2021/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ALCWatefallFlowLayout;

@protocol  ALCWatefallFlowLayoutDeleaget<NSObject>

@required
/**
* 每个item的高度
*/
- (CGFloat)waterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 有多少列
 */
- (NSUInteger)columnCountInWaterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout;

/**
 * 每列之间的间距
 */
- (CGFloat)columnMarginInWaterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout;

/**
 * 每行之间的间距
 */
- (CGFloat)rowMarginInWaterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout;

/**
 * 每个item的内边距
 */
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout;

@end

@interface ALCWatefallFlowLayout : UICollectionViewFlowLayout

/** 代理 */
@property (nonatomic, weak) id<ALCWatefallFlowLayoutDeleaget> delegate;

@end

NS_ASSUME_NONNULL_END
