#import "ViewController.h"
#import "PersonViewModel.h"
#import "Person.h"
#import "ShowTableViewCell.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *showTable;
@property (nonatomic,copy)NSArray *items;

@end

@implementation ViewController
-(void)loadData
{
    __weak typeof (self)weakSelf=self;
    
  weakSelf.showTable.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [PersonViewModel persons:^(id obj) {
            weakSelf.items=obj;
            [weakSelf.showTable reloadData];
            [weakSelf.showTable.mj_header endRefreshing];
        }];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    

    self.showTable=[UITableView new];
    self.showTable.delegate=self;
    self.showTable.dataSource=self;
    [self.showTable registerNib:[UINib nibWithNibName:kShowTableViewCell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kShowTableViewCell];
  self.showTable.separatorStyle=UITableViewCellSelectionStyleNone;
    self.showTable.rowHeight=UITableViewAutomaticDimension;
    [self.view addSubview:self.showTable];
    
    if(@available(iOS 11.0,*))
    {
        
         self.showTable.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }
    else
    {
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    
    [self.showTable mas_makeConstraints:^(MASConstraintMaker *make) {
       
        if(@available(iOS 11.0,*))
        {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }
        else
        {
            make.size.equalTo(self.view);
            make.center.equalTo(self.view);
        }
    }];
    
    __weak typeof (self)weakSelf=self;
    [weakSelf loadData];
    
    [weakSelf.showTable.mj_header beginRefreshing];
}
#pragma  mark table delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShowTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kShowTableViewCell];
    if(cell==nil)
    {
        cell=[[NSBundle mainBundle]loadNibNamed:kShowTableViewCell owner:self options:nil].lastObject;
    }
    cell.person=self.items[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
