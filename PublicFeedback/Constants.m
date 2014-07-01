

#import "Constants.h"

@implementation Constants

// Default
int const OFFSET_WIDTH_TABLE_LABEL = 165;
int const OFFSET_WIDTH_TABLE_ICON = 125;

NSString *const SP_THEME_FONT = @"OpenSans";
NSString *const SP_THEME_FONT2 = @"OpenSans";
NSString *const SP_THEME_FONT_MEDIUM = @"OpenSans-Semibold";
NSString *const SP_THEME_FONT_BOLD = @"OpenSans-Bold";
NSString *const SP_THEME_FONT_HEADER_BOLD = @"Oswald-Regular";
//NSString *const SP_THEME_FONT = @"BentonSans-Regular";
//NSString *const SP_THEME_FONT2 = @"BentonSans-Medium";
//NSString *const SP_THEME_FONT_MEDIUM = @"BentonSans-Medium";
//NSString *const SP_THEME_FONT_BOLD = @"BentonSans-Bold";

@end

@implementation UIColor (SP)

// Dimensional
+(UIColor *) brandColor1 { return [UIColor colorWithRed:191/255.0 green:209/255.0 blue:228/255.0 alpha:1.0]; } // Lighter
+(UIColor *) brandColor2 { return [UIColor colorWithRed:50/255.0 green:94/255.0 blue:127/255.0 alpha:1.0]; } // Darker

// SAP
//+(UIColor *) brandColor1 { return [UIColor colorWithRed:240/255.0 green:171/255.0 blue:0/255.0 alpha:1.0]; }
//+(UIColor *) brandColor2 { return [UIColor colorWithRed:240/255.0 green:171/255.0 blue:0/255.0 alpha:1.0]; }

//+(UIColor *) brandColor1 { return [UIColor colorWithRed:115/255.0 green:153/255.0 blue:198/255.0 alpha:1.0]; }
//+(UIColor *) brandColor2 { return [UIColor colorWithRed:240/255.0 green:161/255.0 blue:53/255.0 alpha:1.0];  } // SCB Green

// Default
//+(UIColor *) brandColor1 { return [UIColor colorWithRed:115/255.0 green:153/255.0 blue:198/255.0 alpha:1.0]; }
//+(UIColor *) brandColor2 { return [UIColor colorWithRed:172/255.0 green:64/255.0 blue:53/255.0 alpha:1.0]; }


// GS
//
//int const OFFSET_WIDTH_TABLE_LABEL = 165;
//int const OFFSET_WIDTH_TABLE_ICON = 125;
//
//NSString *const SP_THEME_FONT = @"HelveticaNeue";
//NSString *const SP_THEME_FONT2 = @"HelveticaNeue-Medium";
//NSString *const SP_THEME_FONT_BOLD = @"HelveticaNeue-Bold";
//
//@end
//
//@implementation UIColor (SP)
//
//+(UIColor *) brandColor1 { return [UIColor colorWithRed:115/255.0 green:153/255.0 blue:198/255.0 alpha:1.0]; }
//+(UIColor *) brandColor2 { return [UIColor colorWithRed:172/255.0 green:64/255.0 blue:53/255.0 alpha:1.0]; }


@end
