
#import "ShowTableViewCell.h"
#import <Masonry/Masonry.h>
#import "Person.h"

@interface ShowTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@end

@implementation ShowTableViewCell
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.lblName mas_makeConstraints:^(MASConstraintMaker *make) {
        
          if(@available(iOS 11.0,*))
          {
              
              make.centerX.equalTo(self.contentView);
              make.top.equalTo(self.contentView.mas_safeAreaLayoutGuideTop).offset(10);
              make.bottom.equalTo(self.lblAge.mas_safeAreaLayoutGuideTop).offset(-10);
              make.height.equalTo(@30);
          }
         else
        {
            make.centerX.equalTo(self.contentView);
           
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.bottom.equalTo(self.lblAge.mas_top).offset(-10);
            
        }
    }];
    [self.lblAge mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if(@available(iOS 11.0,*))
        {
        make.top.equalTo(self.lblName.mas_safeAreaLayoutGuideBottom).offset(10);
            make.centerX.equalTo(self.contentView);
            make.height.equalTo(@20);
        }
        else
        {
        
            make.top.equalTo(self.lblName.mas_bottom).offset(10);
            make.centerX.equalTo(self.contentView);
            make.height.equalTo(@20);
        }
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
         if(@available(iOS 11.0,*))
         {
             make.width.equalTo(self.contentView);
         make.bottom.equalTo(self.contentView.mas_safeAreaLayoutGuideBottom);
             make.height.equalTo(@1);
         }
        else
        {
           make.left.right.bottom.equalTo(self.contentView);
            make.height.equalTo(@1);
        }
    }];
}
-(void)setPerson:(Person *)person
{
    
    _lblName.text=[NSString stringWithFormat:@"姓名：%@",person.name];
    _lblAge.text=[NSString stringWithFormat:@"年龄：%ld",person.age.integerValue];
    
}
@end
