//
//  ViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2021/2/7.
//

#import "ViewController.h"
#define viewHeight 300 // 蜡烛图高度
#define space 3 // 每条蜡烛图的间隙
#define MaxVisibleKLineCount 300 // 每次提取限制300个数据
#define MaxCacheKLineCount 600 // 数组限制最多600个可视数据
#define volumeHeight 80  // 成交量图形高度

@interface TipModel : NSObject
@property (nonatomic, copy) NSString * condition_1;
@property (nonatomic, copy) NSString * condition_2;
@property (nonatomic, copy) NSString * condition_3;
@property (nonatomic, copy) NSString * condition_4;
@property (nonatomic, copy) NSString * condition_5;
@property (nonatomic, copy) NSString * condition_6;
@property (nonatomic, copy) NSString * condition_7;
@property (nonatomic, copy) NSString * condition_8;
@end

@implementation TipModel
- (NSString *)condition_1 {
    if (_condition_1 == nil) {
        _condition_1 = [NSString new];
    }
    return _condition_1;
}

- (NSString *)condition_2 {
    if (_condition_2 == nil) {
        _condition_2 = [NSString new];
    }
    return _condition_2;
}

- (NSString *)condition_3 {
    if (_condition_3 == nil) {
        _condition_3 = [NSString new];
    }
    return _condition_3;
}

- (NSString *)condition_4 {
    if (_condition_4 == nil) {
        _condition_4 = [NSString new];
    }
    return _condition_4;
}

- (NSString *)condition_5 {
    if (_condition_5 == nil) {
        _condition_5 = [NSString new];
    }
    return _condition_5;
}

- (NSString *)condition_6 {
    if (_condition_6 == nil) {
        _condition_6 = [NSString new];
    }
    return _condition_6;
}

- (NSString *)condition_7 {
    if (_condition_7 == nil) {
        _condition_7 = [NSString new];
    }
    return _condition_7;
}

- (NSString *)condition_8 {
    if (_condition_8 == nil) {
        _condition_8 = [NSString new];
    }
    return _condition_8;
}



@end

@interface TipView : UIView
@property (nonatomic, strong) TipModel *model;
@end

@interface TipView()
@property (nonatomic, strong) UILabel *titleLabel_1;
@property (nonatomic, strong) UILabel *titleLabel_2;
@property (nonatomic, strong) UILabel *titleLabel_3;
@property (nonatomic, strong) UILabel *titleLabel_4;
@property (nonatomic, strong) UILabel *titleLabel_5;
@property (nonatomic, strong) UILabel *titleLabel_6;
@property (nonatomic, strong) UILabel *titleLabel_7;
@property (nonatomic, strong) UILabel *titleLabel_8;
@end

@implementation TipView

- (void)setModel:(TipModel *)model {
    _model = model;
    self.titleLabel_1.str(_model.condition_1);
    self.titleLabel_2.str(_model.condition_2);
    self.titleLabel_3.str(_model.condition_3);
    self.titleLabel_4.str(_model.condition_4);
    self.titleLabel_5.str(_model.condition_5);
    self.titleLabel_6.str(_model.condition_6);
    self.titleLabel_7.str(_model.condition_7);
    self.titleLabel_8.str(_model.condition_8);
    
    NSArray *lines_6 = [_model.condition_6 componentsSeparatedByString:@"\n"];
    NSInteger newlineCount_6 = lines_6.count - 1;
    if (newlineCount_6 == 0) { newlineCount_6 = 1; }
    self.titleLabel_6.updateCons(^{
        make.height.equal.constants(newlineCount_6*20);
    });
    
    NSArray *lines_7 = [_model.condition_7 componentsSeparatedByString:@"\n"];
    NSInteger newlineCount_7 = lines_7.count - 1;
    if (newlineCount_7 == 0) { newlineCount_7 = 1; }
    self.titleLabel_7.updateCons(^{
        make.height.equal.constants(newlineCount_7*20);
    });
        
    NSArray *lines_8 = [_model.condition_8 componentsSeparatedByString:@"\n"];
    NSInteger newlineCount_8 = lines_8.count - 1;
    if (newlineCount_8 <= 0) { newlineCount_8 = 1; }
    self.titleLabel_8.updateCons(^{
        make.height.equal.constants(newlineCount_8*20);
    });
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self buildUI];
    return self;
}

-(void) buildUI{
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    self.hidden = YES;
    
    self.titleLabel_1 = [UILabel new];
    self.titleLabel_1.textColor = [UIColor whiteColor];
    self.titleLabel_1.addTo(self).fnt(12).bgColor([UIColor cyanColor]).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_2 = [UILabel new];
    self.titleLabel_2.textColor = [UIColor whiteColor];
    self.titleLabel_2.addTo(self).fnt(12).bgColor([UIColor magentaColor]).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_1).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_3 = [UILabel new];
    self.titleLabel_3.textColor = [UIColor whiteColor];
    self.titleLabel_3.addTo(self).fnt(12).bgColor([UIColor lightGrayColor]).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_2).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_4 = [UILabel new];
    self.titleLabel_4.textColor = [UIColor whiteColor];
    self.titleLabel_4.addTo(self).fnt(12).bgColor([UIColor purpleColor]).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_3).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_5 = [UILabel new];
    self.titleLabel_5.textColor = [UIColor whiteColor];
    self.titleLabel_5.addTo(self).fnt(12).bgColor([UIColor blueColor]).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_4).bottom.constants(0);
        make.height.equal.constants(20);
    });
    
    self.titleLabel_6 = [UILabel new];
    self.titleLabel_6.textColor = [UIColor whiteColor];
    self.titleLabel_6.addTo(self).fnt(12).bgColor([UIColor greenColor]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_5).bottom.constants(0);
        make.height.equal.constants(80);
    });
    
    self.titleLabel_7 = [UILabel new];
    self.titleLabel_7.textColor = [UIColor whiteColor];
    self.titleLabel_7.addTo(self).fnt(12).bgColor([UIColor orangeColor]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_6).bottom.constants(0);
        make.height.equal.constants(120);
    });
    
    self.titleLabel_8 = [UILabel new];
    self.titleLabel_8.textColor = [UIColor whiteColor];
    self.titleLabel_8.addTo(self).fnt(12).bgColor([UIColor redColor]).lines(0).makeCons(^{
        make.left.equal.view(self);
        make.right.equal.view(self);
        make.top.equal.view(self.titleLabel_7).bottom.constants(0);
        make.height.equal.constants(120);
    });
    
}

@end

@interface KLineModel : NSObject
@property (nonatomic, assign) CGFloat open;
@property (nonatomic, assign) CGFloat high;
@property (nonatomic, assign) CGFloat low;
@property (nonatomic, assign) CGFloat close;
@property (nonatomic, assign) NSTimeInterval timestamp;
@property (nonatomic, assign) CGFloat volume;
@end

@implementation KLineModel
@end

typedef void(^KLineScaleAction)(BOOL clickState);

typedef void(^KLineTipModelAction)(TipModel* tipModel);

@interface KLineChartView : UIView
//可视view的数据，限制最多900条蜡烛图(总的数据当中的一部分)
@property (nonatomic, strong) NSArray<KLineModel *> *visibleKLineData;
//可视图x的偏移值，(可视图相对总图的x显示位置)
@property (nonatomic, assign) CGFloat contentOffsetX;
//蜡烛图的宽度
@property (nonatomic, assign) CGFloat candleWidth;
//长按手势:是否显示虚线
@property (nonatomic, assign) BOOL showCrossLine;
//长按手势相关: 十字线的point点
@property (nonatomic, assign) CGPoint crossPoint;
//长按手势相关
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
//捏合手势
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture;
//用户长按传递出去控制器显示tipview
@property (nonatomic, copy) KLineScaleAction scaleCallback;
//用户长按返回计算好的TipModel
@property (nonatomic, copy) KLineTipModelAction tipModelCallback;
@end

@implementation KLineChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //初始化蜡烛图宽度
        _candleWidth = 8;
        //长按手势初始化
        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        _longPressGesture.minimumPressDuration = 0.3;
        _longPressGesture.allowableMovement = 15;
        [self addGestureRecognizer:_longPressGesture];
        //捏合手势初始化
        _pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        [self addGestureRecognizer:_pinchGesture];
    }
    return self;
}

//长按手势处理
- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self];
    
    if (gesture.state == UIGestureRecognizerStateBegan ||
        gesture.state == UIGestureRecognizerStateChanged) {
        self.showCrossLine = YES;
        self.crossPoint = point;
        [self setNeedsDisplay];
        if (self.scaleCallback) {
            self.scaleCallback(YES);
        }
    } else {
        self.showCrossLine = NO;
        [self setNeedsDisplay];
        if (self.scaleCallback) {
            self.scaleCallback(NO);
        }
    }
}

//捏合手势处理
/**
 1.捏合根据gesture.scale 转换成  缩放比例，缩放蜡烛图的大小
 2.重新计算  scrollView 的 contentSize 和 contentOffset
 3.缩放目标保持在中间不动(写得不好)
 */
- (void)handlePinch:(UIPinchGestureRecognizer *)gesture {
    static CGFloat lastScale = 1.0;

    if (gesture.state == UIGestureRecognizerStateBegan) {
        lastScale = 1.0;
    }

    CGFloat scale = gesture.scale / lastScale;
    lastScale = gesture.scale;

    // 限制 candleWidth 范围
    CGFloat newWidth = self.candleWidth * scale;
    newWidth = MAX(2, MIN(newWidth, 40));

    if (fabs(newWidth - self.candleWidth) < 0.01) return;

    // 找到手势中心点在 chartView 中的坐标
    CGPoint pinchCenterInView = [gesture locationInView:self];
    CGFloat centerX = pinchCenterInView.x;

    // 旧宽度下的 index
    NSInteger oldIndex = centerX / (self.candleWidth + space);

    // 旧相对偏移比例（在 scrollView 中）
    CGFloat ratio = (centerX) / self.bounds.size.width;

    // 更新 candleWidth
    self.candleWidth = newWidth;

    // 更新自身 frame 宽度
    CGFloat newChartWidth = self.visibleKLineData.count * (self.candleWidth + space);
    CGRect frame = self.frame;
    frame.size.width = newChartWidth;
    self.frame = frame;

    // 更新 scrollView 的 contentSize 和 contentOffset
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self.superview;
        scrollView.contentSize = CGSizeMake(newChartWidth, scrollView.contentSize.height);

        // 重新计算缩放后的偏移
        CGFloat newOffsetX = oldIndex * (self.candleWidth + space) - ratio * scrollView.bounds.size.width;
        newOffsetX = MAX(0, MIN(newOffsetX, scrollView.contentSize.width - scrollView.bounds.size.width));
        scrollView.contentOffset = CGPointMake(newOffsetX, 0);
    }

    [self setNeedsDisplay];
}

- (void)setContentOffsetX:(CGFloat)contentOffsetX {
    _contentOffsetX = contentOffsetX;
    [self setNeedsDisplay];
}

// 检测山峰的方法（更严格，基于涨幅与回落幅度 + 动态基准价）
- (NSArray *)findPeaksInData {
    NSMutableArray *peaks = [NSMutableArray array];
    if (self.visibleKLineData.count < 8) return peaks;
    
    for (NSInteger i = 4; i < self.visibleKLineData.count - 3; i++) {
        KLineModel *rise_4  = self.visibleKLineData[i - 4];  //升_4
        KLineModel *rise_3  = self.visibleKLineData[i - 3];  //升_3
        KLineModel *rise_2  = self.visibleKLineData[i - 2];  //升_2
        KLineModel *rise_1  = self.visibleKLineData[i - 1];  //升_1
        KLineModel *fall_1  = self.visibleKLineData[i];      //跌_1
        KLineModel *fall_2  = self.visibleKLineData[i + 1];  //跌_2
        KLineModel *fall_3  = self.visibleKLineData[i + 2];  //跌_3
        KLineModel *fall_4  = self.visibleKLineData[i + 3];  //跌_4

        //判断k线涨还是跌
        BOOL rise_4_up   =  rise_4.close  > rise_4.open  ? YES : NO;
        BOOL rise_3_up   =  rise_3.close  > rise_3.open  ? YES : NO;
        BOOL rise_2_up   =  rise_2.close  > rise_2.open  ? YES : NO;
        BOOL rise_1_up   =  rise_1.close  > rise_1.open  ? YES : NO;
        BOOL fall_1_up   =  fall_1.close      > fall_1.open      ? YES : NO;
        BOOL fall_2_up   =  fall_2.close      > fall_2.open      ? YES : NO;
        BOOL fall_3_up   =  fall_3.close      > fall_3.open      ? YES : NO;
        BOOL fall_4_up   =  fall_4.close      > fall_4.open      ? YES : NO;

        //条件1: 下跌第一根一定要下跌 && 下跌最少0.1%☑️
        if (fall_1_up == NO && (fall_1.open - fall_1.close) / fall_1.open > 0.001) {
            //条件2: 下跌第一根 到 上升前第三根 最少上涨 3% (这里不需要判断上升前第三根是升还是跌) ☑️
            if (fall_1.open / rise_3.open > 0.03 ) {
                //条件3: 上升第一条一定要是升的 ☑️
                if (rise_1_up == YES) {
                    if (rise_2_up == YES && rise_3_up == YES ) {//第二条上升 跟 第三条上升
                        //下跌第一条 到 下跌第三条 有0.3%的差距
                        if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {
                            
                            
                            if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                    continue;
                                } else {
                                    [peaks addObject:@(i + 2)];
                                    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                    [peaks removeAllObjects];
                                    [peaks addObjectsFromArray:[orderedSet array]];
                                    continue;
                                }
                            } else {
                                [peaks addObject:@(i)];
                                NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                [peaks removeAllObjects];
                                [peaks addObjectsFromArray:[orderedSet array]];
                                continue;
                            }
                            

                        }
                    } else if (rise_2_up == YES && rise_3_up == NO ) {//第二条上升 跟 第三条下跌
                        if (fall_1.open - rise_3.open > 50) {//左边第三条开盘价要跟下跌第一条50个点的差距
                            //下跌第一条 到 下跌第三条 有0.3%的差距
                            if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {

                                
                                if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                    if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                        continue;
                                    } else {
                                        [peaks addObject:@(i + 2)];
                                        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                        [peaks removeAllObjects];
                                        [peaks addObjectsFromArray:[orderedSet array]];
                                        continue;
                                    }
                                } else {
                                    [peaks addObject:@(i)];
                                    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                    [peaks removeAllObjects];
                                    [peaks addObjectsFromArray:[orderedSet array]];
                                    continue;
                                }
                                
                                
                            }
                        }
                    } else if (rise_2_up == NO && rise_3_up == YES) {
                        if (fall_1.open - rise_2.open > 50) {//左边第二条开盘价要跟下跌第一条50个点的差距
                            //下跌第一条 到 下跌第三条 有0.3%的差距
                            if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {

                                
                                
                                if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                    if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                        continue;
                                    } else {
                                        [peaks addObject:@(i + 2)];
                                        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                        [peaks removeAllObjects];
                                        [peaks addObjectsFromArray:[orderedSet array]];
                                        continue;
                                    }
                                } else {
                                    [peaks addObject:@(i)];
                                    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                    [peaks removeAllObjects];
                                    [peaks addObjectsFromArray:[orderedSet array]];
                                    continue;
                                }
                                
                                
                            }
                        }
                    } else if (rise_2_up == NO && rise_3_up == NO) {
                        //左边第二条开盘价要跟下跌第一条70个点的差距 && 左边第三条开盘价要跟下跌第一条50个点的差距
                        if ( (fall_1.open - rise_2.open > 70) && (fall_1.open - rise_3.open > 50) ) {
                            //下跌第一条 到 下跌第三条 有0.3%的差距
                            if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {

                                
                                if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                    if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                        continue;
                                    } else {
                                        [peaks addObject:@(i + 2)];
                                        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                        [peaks removeAllObjects];
                                        [peaks addObjectsFromArray:[orderedSet array]];
                                        continue;
                                    }
                                } else {
                                    [peaks addObject:@(i)];
                                    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:peaks];
                                    [peaks removeAllObjects];
                                    [peaks addObjectsFromArray:[orderedSet array]];
                                    continue;
                                }
                                
                                
                                
                            }
                        }
                    }
   
                }
            }
        }
    }
    
    return peaks;
}

- (void)drawRect:(CGRect)rect {
    if (!self.visibleKLineData || self.visibleKLineData.count == 0) return;

    //数组中开始的index
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 可视view显示的个数
    NSInteger countInView = ceil(screenWidth / (self.candleWidth + space)) + 1;
    NSInteger startIndex = MAX(0, self.contentOffsetX / (self.candleWidth + space));
    //可视数组中结束的index
    NSInteger endIndex = MIN(startIndex + countInView, self.visibleKLineData.count);

    // 局部最大最小价
    CGFloat maxPrice  = -MAXFLOAT;
    CGFloat minPrice  = MAXFLOAT;
    CGFloat maxVolume = -MAXFLOAT;

    for (NSInteger i = startIndex; i < endIndex; i++) {
        KLineModel *model = self.visibleKLineData[i];
        maxPrice = MAX(maxPrice, model.high);
        minPrice = MIN(minPrice, model.low);
        maxVolume = MAX(maxVolume, model.volume);
    }

    CGFloat marginRatio = 0.1;
    CGFloat priceRange = maxPrice - minPrice;
    CGFloat padding = priceRange * marginRatio;
    maxPrice += padding;
    minPrice -= padding;

    //求出可视view一格代表多少钱(1格/100元，1格/200元)
    CGFloat scale = viewHeight / (maxPrice - minPrice);
    CGFloat volumeTop = viewHeight + 10;
    CGFloat volumeScale = (maxVolume > 0) ? (volumeHeight / maxVolume) : 0;
    
    // 绘制所在view的山峰并标记
    NSArray *peaks = [self findPeaksInData];
    for (NSNumber *peakIndex in peaks) {
        NSInteger i = [peakIndex integerValue];
        if (i >= startIndex && i <= endIndex) {
            KLineModel *peakModel = self.visibleKLineData[i];
            CGFloat x = i * (self.candleWidth + space) + self.candleWidth/2;
            CGFloat y = (maxPrice - peakModel.high) * scale;
            
            // 绘制山峰标记
            NSString *peakText = @"山峰";
            NSDictionary *attrs = @{
                NSFontAttributeName: [UIFont systemFontOfSize:10],
                NSForegroundColorAttributeName: [UIColor redColor]
            };
            CGSize textSize = [peakText sizeWithAttributes:attrs];
            CGRect textRect = CGRectMake(x - textSize.width/2, y - textSize.height - 5, textSize.width, textSize.height);
            [peakText drawInRect:textRect withAttributes:attrs];
            
            // 可选：在峰顶画一个小红点
            CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
            CGContextFillEllipseInRect(ctx, CGRectMake(x - 2, y - 2, 4, 4));
        }
    }

    // 绘制K线
    for (NSInteger i = startIndex; i < endIndex; i++) {
        KLineModel *model = self.visibleKLineData[i];
        CGFloat x = i * (self.candleWidth + space);
        CGFloat openY = (maxPrice - model.open) * scale;
        CGFloat closeY = (maxPrice - model.close) * scale;
        CGFloat highY = (maxPrice - model.high) * scale;
        CGFloat lowY = (maxPrice - model.low) * scale;

        UIColor *color = model.close >= model.open ? [UIColor redColor] : [UIColor colorWithRed:0.23 green:0.74 blue:0.52 alpha:1.0];
        CGContextSetStrokeColorWithColor(ctx, color.CGColor);
        CGContextSetLineWidth(ctx, 1);
        CGContextMoveToPoint(ctx, x + self.candleWidth/2, highY);
        CGContextAddLineToPoint(ctx, x + self.candleWidth/2, lowY);
        CGContextStrokePath(ctx);

        CGContextSetFillColorWithColor(ctx, color.CGColor);
        if (model.close >= model.open) {
            CGContextFillRect(ctx, CGRectMake(x, closeY, self.candleWidth, openY - closeY));
        } else {
            CGContextFillRect(ctx, CGRectMake(x, openY, self.candleWidth, closeY - openY));
        }
        
        // 成交量
        CGFloat volHeight = model.volume * volumeScale;
        CGFloat volY = volumeTop + volumeHeight - volHeight;
        CGContextFillRect(ctx, CGRectMake(x, volY, self.candleWidth, volHeight));
        
        // 绘制每条k线涨跌幅 显示在蜡烛图的底部
        if (model.open > 0) {
            CGFloat changePercent = ((model.close - model.open) / model.open) * 100;
            NSString *percentText = [NSString stringWithFormat:@"%.1f", changePercent];
            NSDictionary *percentAttr = @{
                NSFontAttributeName: [UIFont systemFontOfSize:8],
                NSForegroundColorAttributeName: color
            };
            CGSize size = [percentText sizeWithAttributes:percentAttr];
            
            // 正确：基于最低价位置绘制文字
            CGFloat textX = x + (self.candleWidth - size.width) / 2;
            CGFloat textY = lowY + 2; // lowY 是最低价对应的 Y 坐标

            [percentText drawAtPoint:CGPointMake(textX, textY) withAttributes:percentAttr];
        }
    }
    
    //长按十字线
    if (self.showCrossLine) {
        NSInteger index = round(self.crossPoint.x / (self.candleWidth + space));
        
        if (index >= 0 && index < self.visibleKLineData.count) {
            KLineModel *model = self.visibleKLineData[index];
            
            TipModel *tipModel = [self calculateKLineResultWithI:index];//计算当天k线的是否符合条件的结果
            if (self.tipModelCallback) {
                self.tipModelCallback(tipModel);
            }

            // 计算该蜡烛的中心 X 位置
            CGFloat candleCenterX = index * (self.candleWidth + space) + self.candleWidth / 2.0;
            CGFloat y = self.crossPoint.y;

            // 绘制虚线
            CGContextSetLineWidth(ctx, 0.5);
            CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
            CGFloat dashPattern[] = {4, 2};
            CGContextSetLineDash(ctx, 0, dashPattern, 2);

            // 横线
            CGContextMoveToPoint(ctx, 0, y);
            CGContextAddLineToPoint(ctx, self.bounds.size.width, y);
            CGContextStrokePath(ctx);

            // 纵线
            CGContextMoveToPoint(ctx, candleCenterX, 0);
            CGContextAddLineToPoint(ctx, candleCenterX, self.bounds.size.height);
            CGContextStrokePath(ctx);
            CGContextSetLineDash(ctx, 0, NULL, 0); // 关闭虚线

            // 长按显示：价格
            CGFloat priceRange = maxPrice - minPrice;
            CGFloat scale = viewHeight / priceRange;
            CGFloat price = maxPrice - y / scale;
            NSString *priceText = [NSString stringWithFormat:@"%.2f", price];
            NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor]};
            CGSize priceTextSize = [priceText sizeWithAttributes:attr];
            CGFloat leftX = self.contentOffsetX + 2; // 加2是为了内边距美观
            CGFloat priceTextY = y - priceTextSize.height / 2.0;
            [priceText drawAtPoint:CGPointMake(leftX, priceTextY) withAttributes:attr];

            // 长按显示：时间、成交量
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.timestamp];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH";
            NSString *dateStr = [formatter stringFromDate:date];
            NSString *volumeStr = [NSString stringWithFormat:@"量: %.0f", model.volume];
            NSString *info = [NSString stringWithFormat:@"%@  %@", dateStr, volumeStr];
            CGSize textSize = [info sizeWithAttributes:attr];
            // 显示在成交量图下方（比 volume 区域再低一些）
            CGFloat textY = viewHeight - 18; // 比成交量底部低 5px
            CGFloat infoX = MIN(MAX(0, candleCenterX - textSize.width / 2), self.bounds.size.width - textSize.width);
            [info drawAtPoint:CGPointMake(infoX, textY) withAttributes:attr];
        }
    }
    
}



-(TipModel *) calculateKLineResultWithI:(NSInteger)i {
    
    TipModel *model = [TipModel new];
    
    if (i - 4 < 0 || i + 3 >= self.visibleKLineData.count) {
        return [TipModel new];
    }

    KLineModel *rise_4  = self.visibleKLineData[i - 4];  //升_4
    KLineModel *rise_3  = self.visibleKLineData[i - 3];  //升_3
    KLineModel *rise_2  = self.visibleKLineData[i - 2];  //升_2
    KLineModel *rise_1  = self.visibleKLineData[i - 1];  //升_1
    KLineModel *fall_1  = self.visibleKLineData[i];      //跌_1
    KLineModel *fall_2  = self.visibleKLineData[i + 1];  //跌_2
    KLineModel *fall_3  = self.visibleKLineData[i + 2];  //跌_3
    KLineModel *fall_4  = self.visibleKLineData[i + 3];  //跌_4

    //判断k线涨还是跌
    BOOL rise_4_up   =  rise_4.close  > rise_4.open  ? YES : NO;
    BOOL rise_3_up   =  rise_3.close  > rise_3.open  ? YES : NO;
    BOOL rise_2_up   =  rise_2.close  > rise_2.open  ? YES : NO;
    BOOL rise_1_up   =  rise_1.close  > rise_1.open  ? YES : NO;
    BOOL fall_1_up   =  fall_1.close  > fall_1.open  ? YES : NO;
    BOOL fall_2_up   =  fall_2.close  > fall_2.open  ? YES : NO;
    BOOL fall_3_up   =  fall_3.close  > fall_3.open  ? YES : NO;
    BOOL fall_4_up   =  fall_4.close  > fall_4.open  ? YES : NO;

    //条件1: 下跌第一根一定要下跌 && 下跌最少0.1%☑️
    if (fall_1_up == NO && (fall_1.open - fall_1.close) / fall_1.open > 0.001) {
        model.condition_1 = @"符合: 条件1: 第一根肯定下跌 && 下跌最少0.1%";
        //条件2: 下跌第一根 到 上升前第三根 最少上涨 3% (这里不需要判断上升前第三根是升还是跌) ☑️
        if (fall_1.open / rise_3.open > 0.03 ) {
            model.condition_2 = @"符合: 条件2:  下跌第一根 到 上升前第三根 最少上涨 3%";
            //条件3: 上升第一条一定要是升的 ☑️
            if (rise_1_up == YES) {
                model.condition_3 = @"符合: 条件3: 下跌第一根左边那根肯定是上升的";
                if (rise_2_up == YES && rise_3_up == YES ) {//第二条上升 跟 第三条上升
                    model.condition_4 = @"符合: 条件4: (上升满意) 上升第二条上升 && 上升第三条上升";
                    //下跌第一条 到 下跌第三条 有0.3%的差距
                    if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {
                        model.condition_5 = @"符合: 条件5: (下跌完成)下跌第一条 到 下跌第三条 有0.3%差距";
                        
                        if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                            model.condition_6 = @"下跌第二条是上升 && 下跌第二条跟第一条的开盘价不足20点 向前移动两格再判断";
                            if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                model.condition_7 = @"下跌第四条是上升 && 下跌第四条跟第一条的开盘价不足20点(放弃)";
                            } else {
                                model.condition_7 = @"(满意)当前定位已经向前移动两格 \n 加入原因： \n 1.下跌第四条上升，下跌第四条跟下跌第一条>20个点。 \n 2.下跌第四条下跌，下跌第四条跟下跌第一条的开盘价不足20点。 \n 3.下跌第四条下跌，下跌第四条跟下跌第一条>20个点";
                            }
                        } else {
                            model.condition_6 = @"(全部满意) 加入原因： \n 1.下跌第二条是上升&&下跌第一条跟下跌第二条超过20格 \n 2.下跌第二条是下跌&&下跌第二条跟第一条的开盘价不足20点 \n 3.下跌第二条是下跌&&第一条跟下跌第二条超过20格";
                        }
                        

                    } else {
                        model.condition_5 = @"不符合: 条件5: 下跌第一条 到 下跌第三条 不足0.3%差距";
                    }
                } else if (rise_2_up == YES && rise_3_up == NO ) {//第二条上升 跟 第三条下跌
                    model.condition_4 = @"未算符合 条件4: 上升第二条上升 && 上升第三条 下跌";
                    if (fall_1.open - rise_3.open > 50) {//左边第三条开盘价要跟下跌第一条50个点的差距
                        model.condition_5 = @"符合: 条件5: (上升满意)下跌第一条跟上升第三条>50";
                        //下跌第一条 到 下跌第三条 有0.3%的差距
                        if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {
                            model.condition_6 = @"符合: 条件6: (下跌满意) 下跌第一条 到 下跌第三条 有0.3%差距";
                            
                            if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                model.condition_7 = @"下跌第二条是上升 && 下跌第二条跟第一条的开盘价不足20点 向前移动两格再判断";
                                if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                    model.condition_8 = @"下跌第四条是上升 && 下跌第四条跟第一条的开盘价不足20点(放弃)";
                                } else {
                                    model.condition_8 = @"(满意)当前定位已经向前移动两格 \n 加入原因： \n 1.下跌第四条上升，下跌第四条跟下跌第一条>20个点。 \n 2.下跌第四条下跌，下跌第四条跟下跌第一条的开盘价不足20点。 \n 3.下跌第四条下跌，下跌第四条跟下跌第一条>20个点";
                                }
                            } else {
                                model.condition_7 = @"(全部满意) 加入原因： \n 1.下跌第二条是上升&&下跌第一条跟下跌第二条超过20格  \n 2.下跌第二条是下跌&&下跌第二条跟第一条的开盘价不足20点 \n 3.下跌第二条是下跌&&第一条跟下跌第二条超过20格";
                            }
                            
                            
                        } else {
                            model.condition_6 = @"不符合: 条件6: (下跌不满意)下跌第一条 到 下跌第三条 不足0.3%差距";
                        }
                    } else {
                        model.condition_5 = @"不符合: 条件5: (上升不满意)下跌第一条跟上升第三条<50";
                    }
                } else if (rise_2_up == NO && rise_3_up == YES) {
                    model.condition_4 = @"未算符合 条件4: 上升第二条下跌 && 上升第三条 上升";
                    if (fall_1.open - rise_2.open > 50) {//左边第二条开盘价要跟下跌第一条50个点的差距
                        model.condition_5 = @"符合: 条件5: (上升满意)下跌第一条跟上升第二条>50";
                        //下跌第一条 到 下跌第三条 有0.3%的差距
                        if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {
                            model.condition_6 = @"符合: 条件6: (下跌满意) 下跌第一条 到 下跌第三条 有0.3%差距";
                            
                            
                            if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                model.condition_7 = @"下跌第二条是上升 && 下跌第二条跟第一条的开盘价不足20点 向前移动两格再判断";
                                if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                    model.condition_8 = @"下跌第四条是上升 && 下跌第四条跟第一条的开盘价不足20点(放弃)";
                                } else {
                                    model.condition_8 = @"(满意)当前定位已经向前移动两格 \n 加入原因：\n 1.下跌第四条上升，下跌第四条跟下跌第一条>20个点。 \n 2.下跌第四条下跌，下跌第四条跟下跌第一条的开盘价不足20点。 \n 3.下跌第四条下跌，下跌第四条跟下跌第一条>20个点";
                                }
                            } else {
                                model.condition_7 = @"(全部满意) 加入原因：\n 1.下跌第二条是上升&&下跌第一条跟下跌第二条超过20格  \n 2.下跌第二条是下跌&&下跌第二条跟第一条的开盘价不足20点  \n 3.下跌第二条是下跌&&第一条跟下跌第二条超过20格";
                            }
                            
                            
                        }else {
                            model.condition_6 = @"不符合: 条件6: (下跌不满意) 下跌第一条 到 下跌第三条 不足0.3%差距";
                        }
                    } else {
                        model.condition_5 = @"不符合: 条件5: (上升不满意)下跌第一条跟上升第二条<50";
                    }
                } else if (rise_2_up == NO && rise_3_up == NO) {
                    model.condition_4 = @"未算符合 条件4: 上升第二条下跌 && 上升第三条 下跌";
                    //左边第二条开盘价要跟下跌第一条70个点的差距 && 左边第三条开盘价要跟下跌第一条50个点的差距
                    if ( (fall_1.open - rise_2.open > 70) && (fall_1.open - rise_3.open > 50) ) {
                        model.condition_5 = @"符合: 条件5: (上升满意)下跌第一条跟上升第二条>70 && 下跌第一条跟上升第三条>50";
                        //下跌第一条 到 下跌第三条 有0.3%的差距
                        if ( (fall_1.open - fall_3.close) / fall_1.open > 0.003 ) {
                            model.condition_6 = @"符合: 条件6: (下跌满意) 下跌第一条 到 下跌第三条 有0.3%差距";
                            
                            if (fall_2_up == YES && (fall_1.open - fall_2.close < 20)) {//如果下跌第二条是上升且接近第一条的开盘价 就跳过两格定位高峰
                                model.condition_7 = @"下跌第二条是上升 && 下跌第二条跟第一条的开盘价不足20点 向前移动两格再判断";
                                if (fall_4_up == YES && (fall_1.open - fall_4.close < 20)) {//如果下跌第四条是上升且接近第一条的开盘价 就略过(属于横盘调整)
                                    model.condition_8 = @"下跌第四条是上升 && 下跌第四条跟第一条的开盘价不足20点(放弃)";
                                } else {
                                    model.condition_8 = @"(满意)当前定位已经向前移动两格 \n 加入原因： \n 1.下跌第四条上升，下跌第四条跟下跌第一条>20个点。 \n 2.下跌第四条下跌，下跌第四条跟下跌第一条的开盘价不足20点。 \n 3.下跌第四条下跌，下跌第四条跟下跌第一条>20个点";
                                }
                            } else {
                                model.condition_7 = @"(全部满意) 加入原因：\n 1.下跌第二条是上升&&下跌第一条跟下跌第二条超过20格 \n 2.下跌第二条是下跌&&下跌第二条跟第一条的开盘价不足20点 \n 3.下跌第二条是下跌&&第一条跟下跌第二条超过20格";
                            }
                            
                            
                            
                        } else {
                            model.condition_6 = @"不符合: 条件6: (下跌不满意) 下跌第一条 到 下跌第三条 不足0.3%差距";
                        }
                    }else{
                        model.condition_5 = @"不符合: 条件5: (上升不满意)下跌第一条跟上升第二条<70 或者 下跌第一条跟上升第三条<50";
                    }
                }

            } else {
                model.condition_3 = @"不符合: 条件3: 上升第一根不是上升";
            }
        } else {
            model.condition_2 = @"不符合: 条件2:  下跌第一根 到 上升前第三根 小于 3%";
        }
    } else {
        model.condition_1 = @"不符合: 条件1: 第一根不一定下跌 && 下跌不足0.1%";
    }
    return model;
}

@end

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KLineChartView *chartView;
@property (nonatomic, strong) NSArray<KLineModel *> *allKLineData;
@property (nonatomic, strong) NSMutableArray<KLineModel *> *loadedKLineData;
@property (nonatomic, assign) NSInteger currentStartIndex;
@property (nonatomic, strong) TipView *tipView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    CGFloat chartHeight = viewHeight + 10 + volumeHeight;
    CGFloat tipViewHeight = self.view.bounds.size.height - statusHeight - bottomSafeHeight -chartHeight;
    self.tipView = [[TipView alloc] initWithFrame:CGRectMake(0, statusHeight, screenWidth, tipViewHeight)];
    self.tipView.addTo(self.view);

    self.allKLineData = [self loadAllData];
    self.currentStartIndex = 0;
    self.loadedKLineData = [[self loadDataFromIndex:self.currentStartIndex count:MaxVisibleKLineCount] mutableCopy];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];

    [self setupChartView:chartHeight];
    
    __weak typeof(self) weakSelf = self;
    self.chartView.scaleCallback = ^(BOOL clickState) {
        weakSelf.tipView.hidden = !clickState;
    };
    
    self.chartView.tipModelCallback = ^(TipModel *tipModel) {
        weakSelf.tipView.model = tipModel;
    };
    
}

- (void)setupChartView:(CGFloat)chartHeight {
    //计算临时显示view的总长度
    CGFloat width = self.loadedKLineData.count * (8 + space);
    KLineChartView *chartView = [[KLineChartView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - chartHeight - bottomSafeHeight, width, chartHeight)];
    chartView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    chartView.visibleKLineData = self.loadedKLineData;

    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.scrollView addSubview:chartView];
    self.scrollView.contentSize = chartView.bounds.size;
    self.chartView = chartView;
}

- (NSArray<KLineModel *> *)loadAllData {
    NSMutableArray *result = [NSMutableArray array];
    NSArray *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"json" inDirectory:nil];
    NSArray *sortedPaths = [paths sortedArrayUsingComparator:^NSComparisonResult(NSString *p1, NSString *p2) {
        return [[p1 lastPathComponent] localizedStandardCompare:[p2 lastPathComponent]];
    }];

    for (NSString *filePath in sortedPaths) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (!data) continue;
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (error) continue;
        NSArray *klineList = json[@"data"][@"kline_list"];
        for (NSDictionary *dict in klineList) {
            KLineModel *model = [[KLineModel alloc] init];
            model.open = [dict[@"open_price"] floatValue];
            model.high = [dict[@"high_price"] floatValue];
            model.low = [dict[@"low_price"] floatValue];
            model.close = [dict[@"close_price"] floatValue];
            model.timestamp = [dict[@"timestamp"] doubleValue];
            model.volume = [dict[@"volume"] floatValue];
            [result addObject:model];
        }
    }
    return result;
}

- (NSArray<KLineModel *> *)loadDataFromIndex:(NSInteger)start count:(NSInteger)count {
    if (start < 0) start = 0;
    NSInteger end = MIN(start + count, self.allKLineData.count);
    return [self.allKLineData subarrayWithRange:NSMakeRange(start, end - start)];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.chartView.contentOffsetX = scrollView.contentOffset.x;
    
    CGFloat candleFullWidth = self.chartView.candleWidth + space;
    CGFloat maxOffsetX = self.loadedKLineData.count * candleFullWidth - screenWidth;

    // 向右滑到底部-把之前左边就的数据删除（数组最多存900个模型）
    if (scrollView.contentOffset.x >= maxOffsetX - 50) {
        NSInteger nextStart = self.currentStartIndex + MaxVisibleKLineCount;
        if (nextStart < self.allKLineData.count) {
            NSInteger nextCount = MIN(MaxVisibleKLineCount, self.allKLineData.count - nextStart);
            NSArray *newData = [self loadDataFromIndex:nextStart count:nextCount];

            [self.loadedKLineData addObjectsFromArray:newData];
            self.currentStartIndex = nextStart;

            // 删除左边多余的数据
            if (self.loadedKLineData.count > MaxCacheKLineCount) {
                NSInteger toRemove = self.loadedKLineData.count - MaxCacheKLineCount;
                NSRange removeRange = NSMakeRange(0, toRemove);
                [self.loadedKLineData removeObjectsInRange:removeRange];

                // 更新 scrollView.contentOffset 保持视觉不跳动
                scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - toRemove * candleFullWidth, 0);
            }

            // 更新图表
            self.chartView.visibleKLineData = self.loadedKLineData;
            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);
            [self.chartView setNeedsDisplay];
        }
    // 向左滑到底部-把之前右边就的数据删除（数组最多存900个模型）
    }else if (scrollView.contentOffset.x <= 50 && self.currentStartIndex > 0) {
        NSInteger prevCount = MaxVisibleKLineCount;
        NSInteger prevStart = MAX(self.currentStartIndex - prevCount, 0);
        NSArray *prevData = [self loadDataFromIndex:prevStart count:(self.currentStartIndex - prevStart)];
        
        if (prevData.count > 0) {
            [self.loadedKLineData insertObjects:prevData atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, prevData.count)]];
            self.currentStartIndex = prevStart;

            // 删除右边多余数据
            if (self.loadedKLineData.count > MaxCacheKLineCount) {
                NSInteger toRemove = self.loadedKLineData.count - MaxCacheKLineCount;
                NSRange removeRange = NSMakeRange(self.loadedKLineData.count - toRemove, toRemove);
                [self.loadedKLineData removeObjectsInRange:removeRange];
            }

            // 更新图表
            self.chartView.visibleKLineData = self.loadedKLineData;
            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);

            // 向左插入后，调整 contentOffset 避免跳动
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + prevData.count * candleFullWidth, 0);
            
            [self.chartView setNeedsDisplay];
        }
    }

}

@end





