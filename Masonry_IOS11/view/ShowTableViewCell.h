#import <UIKit/UIKit.h>
static NSString *kShowTableViewCell=@"ShowTableViewCell";
@class Person;

@interface ShowTableViewCell : UITableViewCell
@property (nonatomic,strong)Person *person;

@end
