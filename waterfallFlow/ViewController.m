//
//  ViewController.m
//  waterfallFlow
//  瀑布流
//  Created by 杨柳 on 2021/4/1.
//

#import "ViewController.h"
#import "LMHShopCell.h"
#import "ALCWatefallFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, ALCWatefallFlowLayoutDeleaget>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *sourceArr;

@end
static NSString * const LMHShopId = @"shop";
@implementation ViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    NSDictionary *dic = @{@"w" : @"200", @"h" : @"100"};
    NSDictionary *dic1 = @{@"w" : @"200", @"h" : @"150"};
    NSDictionary *dic2 = @{@"w" : @"200", @"h" : @"200"};
    NSDictionary *dic3 = @{@"w" : @"200", @"h" : @"180"};
    NSDictionary *dic4 = @{@"w" : @"200", @"h" : @"270"};
    NSDictionary *dic5 = @{@"w" : @"200", @"h" : @"600"};
    self.sourceArr = [[NSMutableArray alloc] init];
    [self.sourceArr addObject:dic];
    [self.sourceArr addObject:dic1];
    [self.sourceArr addObject:dic2];
    [self.sourceArr addObject:dic3];
    [self.sourceArr addObject:dic4];
    [self.sourceArr addObject:dic5];
    
    [self.collectionView reloadData];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"sourceArr:%ld", self.sourceArr.count);
    return self.sourceArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LMHShopCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:LMHShopId forIndexPath:indexPath];
    
    cell.shop = @"111";
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"^%ld", indexPath.row);
}

- (CGFloat)waterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth{
    
    NSDictionary *dic = self.sourceArr[indexPath];
    CGFloat w = [dic[@"w"] floatValue];
    CGFloat h = [dic[@"h"] floatValue];
    
    return itemWidth * h / w;
}

- (CGFloat)rowMarginInWaterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout{
    
    return 20;
    
}

- (NSUInteger)columnCountInWaterFallLayout:(ALCWatefallFlowLayout *)waterFallLayout{
    
    return 2;
    
}

#pragma mark - LazyLoad
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        ALCWatefallFlowLayout * layout = [[ALCWatefallFlowLayout alloc] init];
        layout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:UIScreen.mainScreen.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        self.collectionView.backgroundColor = UIColor.whiteColor;
        self.collectionView.scrollEnabled = YES;
        // 注册
        [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LMHShopCell class]) bundle:nil] forCellWithReuseIdentifier:LMHShopId];
    }
    return _collectionView;
}

@end
