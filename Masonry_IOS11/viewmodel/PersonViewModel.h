#import <Foundation/Foundation.h>
typedef void (^ShareCallback)(id obj);

@interface PersonViewModel : NSObject
+(void)persons:(ShareCallback)callback;
@end
