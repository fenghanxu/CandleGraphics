//
//  ViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2021/2/7.
//

//#import "ViewController.h"
//#define viewHeight 300
//#define space 3
//#define MaxVisibleKLineCount 300
//#define MaxCacheKLineCount 600
//
//@interface KLineModel : NSObject
//@property (nonatomic, assign) CGFloat open;
//@property (nonatomic, assign) CGFloat high;
//@property (nonatomic, assign) CGFloat low;
//@property (nonatomic, assign) CGFloat close;
//@property (nonatomic, assign) NSTimeInterval timestamp;
//@property (nonatomic, assign) CGFloat volume;
//@end
//
//@implementation KLineModel
//@end
//
//@interface KLineChartView : UIView
////可视view的数据，限制最多900条蜡烛图(总的数据当中的一部分)
//@property (nonatomic, strong) NSArray<KLineModel *> *visibleKLineData;
////可视图x的偏移值，(可视图相对总图的x显示位置)
//@property (nonatomic, assign) CGFloat contentOffsetX;
////蜡烛图的宽度
//@property (nonatomic, assign) CGFloat candleWidth;
////长按手势:是否显示虚线
//@property (nonatomic, assign) BOOL showCrossLine;
////长按手势相关: 十字线的point点
//@property (nonatomic, assign) CGPoint crossPoint;
////长按手势相关
//@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
////捏合手势
//@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture;
//@end
//
//@implementation KLineChartView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        //初始化蜡烛图宽度
//        _candleWidth = 8;
//        //长按手势初始化
//        _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//        _longPressGesture.minimumPressDuration = 0.3;
//        _longPressGesture.allowableMovement = 15;
//        [self addGestureRecognizer:_longPressGesture];
//        //捏合手势初始化
//        _pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
//        [self addGestureRecognizer:_pinchGesture];
//    }
//    return self;
//}
//
////长按手势处理
//- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
//    CGPoint point = [gesture locationInView:self];
//    
//    if (gesture.state == UIGestureRecognizerStateBegan ||
//        gesture.state == UIGestureRecognizerStateChanged) {
//        self.showCrossLine = YES;
//        self.crossPoint = point;
//        [self setNeedsDisplay];
//    } else {
//        self.showCrossLine = NO;
//        [self setNeedsDisplay];
//    }
//}
//
////捏合手势处理
///**
// 1.捏合根据gesture.scale 转换成  缩放比例，缩放蜡烛图的大小
// 2.重新计算  scrollView 的 contentSize 和 contentOffset
// 3.缩放目标保持在中间不动(写得不好)
// */
//- (void)handlePinch:(UIPinchGestureRecognizer *)gesture {
//    static CGFloat lastScale = 1.0;
//
//    if (gesture.state == UIGestureRecognizerStateBegan) {
//        lastScale = 1.0;
//    }
//
//    CGFloat scale = gesture.scale / lastScale;
//    lastScale = gesture.scale;
//
//    // 限制 candleWidth 范围
//    CGFloat newWidth = self.candleWidth * scale;
//    newWidth = MAX(2, MIN(newWidth, 40));
//
//    if (fabs(newWidth - self.candleWidth) < 0.01) return;
//
//    // 找到手势中心点在 chartView 中的坐标
//    CGPoint pinchCenterInView = [gesture locationInView:self];
//    CGFloat centerX = pinchCenterInView.x;
//
//    // 旧宽度下的 index
//    NSInteger oldIndex = centerX / (self.candleWidth + space);
//
//    // 旧相对偏移比例（在 scrollView 中）
//    CGFloat ratio = (centerX) / self.bounds.size.width;
//
//    // 更新 candleWidth
//    self.candleWidth = newWidth;
//
//    // 更新自身 frame 宽度
//    CGFloat newChartWidth = self.visibleKLineData.count * (self.candleWidth + space);
//    CGRect frame = self.frame;
//    frame.size.width = newChartWidth;
//    self.frame = frame;
//
//    // 更新 scrollView 的 contentSize 和 contentOffset
//    if ([self.superview isKindOfClass:[UIScrollView class]]) {
//        UIScrollView *scrollView = (UIScrollView *)self.superview;
//        scrollView.contentSize = CGSizeMake(newChartWidth, scrollView.contentSize.height);
//
//        // 重新计算缩放后的偏移
//        CGFloat newOffsetX = oldIndex * (self.candleWidth + space) - ratio * scrollView.bounds.size.width;
//        newOffsetX = MAX(0, MIN(newOffsetX, scrollView.contentSize.width - scrollView.bounds.size.width));
//        scrollView.contentOffset = CGPointMake(newOffsetX, 0);
//    }
//
//    [self setNeedsDisplay];
//}
//
//- (void)setContentOffsetX:(CGFloat)contentOffsetX {
//    _contentOffsetX = contentOffsetX;
//    [self setNeedsDisplay];
//}
//
//- (void)drawRect:(CGRect)rect {
//    if (!self.visibleKLineData || self.visibleKLineData.count == 0) return;
//
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    NSInteger countInView = ceil(screenWidth / (self.candleWidth + space)) + 1;
//    NSInteger startIndex = MAX(0, self.contentOffsetX / (self.candleWidth + space));
//    NSInteger endIndex = MIN(startIndex + countInView, self.visibleKLineData.count);
//
//    CGFloat maxPrice = -MAXFLOAT;
//    CGFloat minPrice = MAXFLOAT;
//    CGFloat maxVolume = -MAXFLOAT;
//
//    for (NSInteger i = startIndex; i < endIndex; i++) {
//        KLineModel *model = self.visibleKLineData[i];
//        maxPrice = MAX(maxPrice, model.high);
//        minPrice = MIN(minPrice, model.low);
//        maxVolume = MAX(maxVolume, model.volume);
//    }
//
//    CGFloat marginRatio = 0.1;
//    CGFloat priceRange = maxPrice - minPrice;
//    CGFloat padding = priceRange * marginRatio;
//    maxPrice += padding;
//    minPrice -= padding;
//
//    CGFloat scale = viewHeight / (maxPrice - minPrice);
//
//    for (NSInteger i = startIndex; i < endIndex; i++) {
//        KLineModel *model = self.visibleKLineData[i];
//        CGFloat x = i * (self.candleWidth + space);
//        CGFloat openY = (maxPrice - model.open) * scale;
//        CGFloat closeY = (maxPrice - model.close) * scale;
//        CGFloat highY = (maxPrice - model.high) * scale;
//        CGFloat lowY = (maxPrice - model.low) * scale;
//
//        UIColor *color = model.close >= model.open ? [UIColor redColor] : [UIColor colorWithRed:0.23 green:0.74 blue:0.52 alpha:1.0];
//        CGContextSetStrokeColorWithColor(ctx, color.CGColor);
//        CGContextSetLineWidth(ctx, 1);
//        CGContextMoveToPoint(ctx, x + self.candleWidth/2, highY);
//        CGContextAddLineToPoint(ctx, x + self.candleWidth/2, lowY);
//        CGContextStrokePath(ctx);
//
//        CGContextSetFillColorWithColor(ctx, color.CGColor);
//        if (model.close >= model.open) {
//            CGContextFillRect(ctx, CGRectMake(x, closeY, self.candleWidth, openY - closeY));
//        } else {
//            CGContextFillRect(ctx, CGRectMake(x, openY, self.candleWidth, closeY - openY));
//        }
//    }
//    
//    //长按十字线
//    if (self.showCrossLine) {
//        NSInteger index = round(self.crossPoint.x / (self.candleWidth + space));
//        
//        if (index >= 0 && index < self.visibleKLineData.count) {
//            KLineModel *model = self.visibleKLineData[index];
//            
//            // 计算该蜡烛的中心 X 位置
//            CGFloat candleCenterX = index * (self.candleWidth + space) + self.candleWidth / 2.0;
//            CGFloat y = self.crossPoint.y;
//
//            // 绘制虚线
//            CGContextSetLineWidth(ctx, 0.5);
//            CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
//            CGFloat dashPattern[] = {4, 2};
//            CGContextSetLineDash(ctx, 0, dashPattern, 2);
//
//            // 横线
//            CGContextMoveToPoint(ctx, 0, y);
//            CGContextAddLineToPoint(ctx, self.bounds.size.width, y);
//            CGContextStrokePath(ctx);
//
//            // 纵线
//            CGContextMoveToPoint(ctx, candleCenterX, 0);
//            CGContextAddLineToPoint(ctx, candleCenterX, self.bounds.size.height);
//            CGContextStrokePath(ctx);
//            CGContextSetLineDash(ctx, 0, NULL, 0); // 关闭虚线
//
//            // 长按显示：价格
//            CGFloat priceRange = maxPrice - minPrice;
//            CGFloat scale = viewHeight / priceRange;
//            CGFloat price = maxPrice - y / scale;
//            NSString *priceText = [NSString stringWithFormat:@"%.2f", price];
//            NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor]};
//            CGSize priceTextSize = [priceText sizeWithAttributes:attr];
//            CGFloat leftX = self.contentOffsetX + 2; // 加2是为了内边距美观
//            CGFloat priceTextY = y - priceTextSize.height / 2.0;
//            [priceText drawAtPoint:CGPointMake(leftX, priceTextY) withAttributes:attr];
//
//            // 长按显示：时间、成交量
//            NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.timestamp];
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat = @"yyyy-MM-dd HH";
//            NSString *dateStr = [formatter stringFromDate:date];
//            NSString *volumeStr = [NSString stringWithFormat:@"量: %.0f", model.volume];
//            NSString *info = [NSString stringWithFormat:@"%@  %@", dateStr, volumeStr];
//            CGSize textSize = [info sizeWithAttributes:attr];
//            // 显示在成交量图下方（比 volume 区域再低一些）
//            CGFloat textY = viewHeight - 18; // 比成交量底部低 5px
//            CGFloat infoX = MIN(MAX(0, candleCenterX - textSize.width / 2), self.bounds.size.width - textSize.width);
//            [info drawAtPoint:CGPointMake(infoX, textY) withAttributes:attr];
//        }
//    }
//    
//}
//
//@end
//
//@interface ViewController () <UIScrollViewDelegate>
//@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) KLineChartView *chartView;
//@property (nonatomic, strong) NSArray<KLineModel *> *allKLineData;
//@property (nonatomic, strong) NSMutableArray<KLineModel *> *loadedKLineData;
//@property (nonatomic, assign) NSInteger currentStartIndex;
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = UIColor.whiteColor;
//
//    self.allKLineData = [self loadAllData];
//    self.currentStartIndex = 0;
//    self.loadedKLineData = [[self loadDataFromIndex:self.currentStartIndex count:MaxVisibleKLineCount] mutableCopy];
//    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    self.scrollView.delegate = self;
//    [self.view addSubview:self.scrollView];
//
//    [self setupChartView];
//}
//
//- (void)setupChartView {
//    //计算临时显示view的总长度
//    CGFloat width = self.loadedKLineData.count * (8 + space);
//    KLineChartView *chartView = [[KLineChartView alloc] initWithFrame:CGRectMake(0, (self.view.bounds.size.height - viewHeight) * 0.5, width, viewHeight)];
//    chartView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
//    chartView.visibleKLineData = self.loadedKLineData;
//
//    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [self.scrollView addSubview:chartView];
//    self.scrollView.contentSize = chartView.bounds.size;
//    self.chartView = chartView;
//}
//
//- (NSArray<KLineModel *> *)loadAllData {
//    NSMutableArray *result = [NSMutableArray array];
//    NSArray *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"json" inDirectory:nil];
//    NSArray *sortedPaths = [paths sortedArrayUsingComparator:^NSComparisonResult(NSString *p1, NSString *p2) {
//        return [[p1 lastPathComponent] localizedStandardCompare:[p2 lastPathComponent]];
//    }];
//
//    for (NSString *filePath in sortedPaths) {
//        NSData *data = [NSData dataWithContentsOfFile:filePath];
//        if (!data) continue;
//        NSError *error;
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        if (error) continue;
//        NSArray *klineList = json[@"data"][@"kline_list"];
//        for (NSDictionary *dict in klineList) {
//            KLineModel *model = [[KLineModel alloc] init];
//            model.open = [dict[@"open_price"] floatValue];
//            model.high = [dict[@"high_price"] floatValue];
//            model.low = [dict[@"low_price"] floatValue];
//            model.close = [dict[@"close_price"] floatValue];
//            model.timestamp = [dict[@"timestamp"] doubleValue];
//            model.volume = [dict[@"volume"] floatValue];
//            [result addObject:model];
//        }
//    }
//    return result;
//}
//
//- (NSArray<KLineModel *> *)loadDataFromIndex:(NSInteger)start count:(NSInteger)count {
//    if (start < 0) start = 0;
//    NSInteger end = MIN(start + count, self.allKLineData.count);
//    return [self.allKLineData subarrayWithRange:NSMakeRange(start, end - start)];
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    self.chartView.contentOffsetX = scrollView.contentOffset.x;
//    
//    CGFloat candleFullWidth = self.chartView.candleWidth + space;
//    CGFloat maxOffsetX = self.loadedKLineData.count * candleFullWidth - screenWidth;
//
//    // 向右滑到底部-把之前左边就的数据删除（数组最多存900个模型）
//    if (scrollView.contentOffset.x >= maxOffsetX - 50) {
//        NSInteger nextStart = self.currentStartIndex + MaxVisibleKLineCount;
//        if (nextStart < self.allKLineData.count) {
//            NSInteger nextCount = MIN(MaxVisibleKLineCount, self.allKLineData.count - nextStart);
//            NSArray *newData = [self loadDataFromIndex:nextStart count:nextCount];
//
//            [self.loadedKLineData addObjectsFromArray:newData];
//            self.currentStartIndex = nextStart;
//
//            // 删除左边多余的数据
//            if (self.loadedKLineData.count > MaxCacheKLineCount) {
//                NSInteger toRemove = self.loadedKLineData.count - MaxCacheKLineCount;
//                NSRange removeRange = NSMakeRange(0, toRemove);
//                [self.loadedKLineData removeObjectsInRange:removeRange];
//
//                // 更新 scrollView.contentOffset 保持视觉不跳动
//                scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - toRemove * candleFullWidth, 0);
//            }
//
//            // 更新图表
//            self.chartView.visibleKLineData = self.loadedKLineData;
//            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
//            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
//            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);
//            [self.chartView setNeedsDisplay];
//        }
//    // 向左滑到底部-把之前右边就的数据删除（数组最多存900个模型）
//    }else if (scrollView.contentOffset.x <= 50 && self.currentStartIndex > 0) {
//        NSInteger prevCount = MaxVisibleKLineCount;
//        NSInteger prevStart = MAX(self.currentStartIndex - prevCount, 0);
//        NSArray *prevData = [self loadDataFromIndex:prevStart count:(self.currentStartIndex - prevStart)];
//        
//        if (prevData.count > 0) {
//            [self.loadedKLineData insertObjects:prevData atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, prevData.count)]];
//            self.currentStartIndex = prevStart;
//
//            // 删除右边多余数据
//            if (self.loadedKLineData.count > MaxCacheKLineCount) {
//                NSInteger toRemove = self.loadedKLineData.count - MaxCacheKLineCount;
//                NSRange removeRange = NSMakeRange(self.loadedKLineData.count - toRemove, toRemove);
//                [self.loadedKLineData removeObjectsInRange:removeRange];
//            }
//
//            // 更新图表
//            self.chartView.visibleKLineData = self.loadedKLineData;
//            CGFloat newWidth = self.loadedKLineData.count * candleFullWidth;
//            self.chartView.frame = CGRectMake(0, self.chartView.frame.origin.y, newWidth, self.chartView.frame.size.height);
//            self.scrollView.contentSize = CGSizeMake(newWidth, self.scrollView.contentSize.height);
//
//            // 向左插入后，调整 contentOffset 避免跳动
//            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + prevData.count * candleFullWidth, 0);
//            
//            [self.chartView setNeedsDisplay];
//        }
//    }
//
//}
//
//@end


#import "ViewController.h"
#define viewHeight 300
#define space 3
#define MaxVisibleKLineCount 300
#define MaxCacheKLineCount 600

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

@interface KLineChartView : UIView
//可视view的数据，限制最多900条蜡烛图(总的数据当中的一部分)
@property (nonatomic, strong) NSArray<KLineModel *> *visibleKLineData;
//可视图x的偏移值，(可视图相对总图的x显示位置)
@property (nonatomic, assign) CGFloat contentOffsetX;
//蜡烛图的宽度
@property (nonatomic, assign) CGFloat candleWidth;
@end

@implementation KLineChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //初始化蜡烛图宽度
        _candleWidth = 8;
    }
    return self;
}

- (void)setContentOffsetX:(CGFloat)contentOffsetX {
    _contentOffsetX = contentOffsetX;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (!self.visibleKLineData || self.visibleKLineData.count == 0) return;

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    NSInteger countInView = ceil(screenWidth / (self.candleWidth + space)) + 1;
    NSInteger startIndex = MAX(0, self.contentOffsetX / (self.candleWidth + space));
    NSInteger endIndex = MIN(startIndex + countInView, self.visibleKLineData.count);

    CGFloat maxPrice = -MAXFLOAT;
    CGFloat minPrice = MAXFLOAT;
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

    CGFloat scale = viewHeight / (maxPrice - minPrice);

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
    }
    
}

@end

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KLineChartView *chartView;
@property (nonatomic, strong) NSArray<KLineModel *> *allKLineData;
@property (nonatomic, strong) NSMutableArray<KLineModel *> *loadedKLineData;
@property (nonatomic, assign) NSInteger currentStartIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    self.allKLineData = [self loadAllData];
    self.currentStartIndex = 0;
    self.loadedKLineData = [[self loadDataFromIndex:self.currentStartIndex count:MaxVisibleKLineCount] mutableCopy];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];

    [self setupChartView];
}

- (void)setupChartView {
    //计算临时显示view的总长度
    CGFloat width = self.loadedKLineData.count * (8 + space);
    KLineChartView *chartView = [[KLineChartView alloc] initWithFrame:CGRectMake(0, (self.view.bounds.size.height - viewHeight) * 0.5, width, viewHeight)];
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
