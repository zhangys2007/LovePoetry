#import <UIKit/UIKit.h>

#define kBDKNotifyHUDDefaultWidth 130.0f
#define kBDKNotifyHUDDefaultHeight 100.0f

@interface BDKNotifyHUD : UIView

@property (nonatomic, assign) CGFloat destinationOpacity;
@property (nonatomic, assign) CGFloat currentOpacity;
@property (nonatomic, retain) UIView *iconView;
@property (nonatomic, assign) CGFloat roundness;
@property (nonatomic, assign) BOOL bordered;
@property (nonatomic, assign) BOOL isAnimating;

@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) NSString *text;

+ (id)notifyHUDWithView:(UIView *)view text:(NSString *)text;
+ (id)notifyHUDWithImage:(UIImage *)image text:(NSString *)text;

- (id)initWithView:(UIView *)view text:(NSString *)text;
- (id)initWithImage:(UIImage *)image text:(NSString *)text;

- (void)setImage:(UIImage *)image;
- (void)presentWithDuration:(CGFloat)duration speed:(CGFloat)speed inView:(UIView *)view completion:(void (^)(void))completion;

@end
