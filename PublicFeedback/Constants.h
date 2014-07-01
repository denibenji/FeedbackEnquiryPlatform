//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT extern int const OFFSET_WIDTH_TABLE_LABEL;
FOUNDATION_EXPORT extern int const OFFSET_WIDTH_TABLE_ICON;

FOUNDATION_EXPORT NSString *const SP_THEME_FONT;
FOUNDATION_EXPORT NSString *const SP_THEME_FONT_BOLD;
FOUNDATION_EXPORT NSString *const SP_THEME_FONT2;
FOUNDATION_EXPORT NSString *const SP_THEME_FONT_MEDIUM;
FOUNDATION_EXPORT NSString *const SP_THEME_FONT_HEADER_BOLD;
@interface Constants : NSObject

@end

@interface UIColor (SP)

+(UIColor *) brandColor1;
+(UIColor *) brandColor2;

@end