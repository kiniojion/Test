//
//  ViewController.m
//  tableViewEditAction1112
//
//  Created by Mac on 15/12/22.
//  Copyright © 2015年 ZI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   

}
//strong 和 retain 一样
@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView=[[[UITableView alloc]initWithFrame:self.view.frame]autorelease];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
   // [self.tableView registerNib:<#(nullable UINib *)#> forCellReuseIdentifier:<#(nonnull NSString *)#>]
    [self.view addSubview:self.tableView];
    
    //UITableViewRowAction cell滑动操作类
    UITableViewRowAction *rowAction=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"测试" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        
        NSLog(@"测试测试");
        }];
    
    UITableViewRowAction *rowAction1=[UITableViewRowAction rowActionWithStyle: UITableViewRowActionStyleDefault title:@"Test" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
         NSLog(@"TestTestTest");
    }];
//self. 不用retain  _arr需要retain  用加号创建
    self.arr=[NSArray arrayWithObjects:rowAction,rowAction1, nil];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"这是第%ld行",indexPath.row];
    return cell;
}
//nullable 可以为空  ios8.0之后
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0){
    
    return self.arr;

}
//nonnull 不能为空
//-(nonnull NSArray*)test{
//    return nil;
//
//}
-(void)dealloc{
    self.tableView=nil;
    [super dealloc];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
