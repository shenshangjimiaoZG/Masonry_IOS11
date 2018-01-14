#import "PersonViewModel.h"
#import "Person.h"


@implementation PersonViewModel

+(void)persons:(ShareCallback)callback
{
    Person *person1=[[Person alloc]init];
    person1.name=@"黄平";
    person1.age=@31;
    
    Person *person2=[[Person alloc]init];
    person2.name=@"吴燕琪";
    person2.age=@29;
    
    callback(@[person1,person2]);
}
@end
