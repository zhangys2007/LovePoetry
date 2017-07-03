//
//  WriteViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/8.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "WriteViewController.h"
#import "MineViewController.h"
#import "WriteHelp.h"
#import "NSString+filePath.h"

@interface WriteViewController ()
@property (nonatomic, strong)UITextField * titleTexField;
@property (nonatomic, strong)UITextField * noteTexField;
@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"新建写作";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"exit_btn"] style:UIBarButtonItemStyleDone target:self action:@selector(exitData)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(saveData)];
    
    [self addView];

}

- (void)exitData{
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)saveData{
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:self.titleTexField.text ,@"title",self.noteTexField.text ,@"note",  nil];
    [self.dataArray addObject:dic];
    __block WriteViewController * weakself = self;
    [self dismissViewControllerAnimated:YES completion:^{
        
        _mineVC.dataArray = weakself.dataArray;
        
        [_mineVC viewDidLoad];
    }];
  
    

      NSLog(@"%@",self.dataArray);
}



- (void)addView{
    
    self.titleTexField = [[UITextField alloc] initWithFrame:CGRectMake(10, 64, 300, 49)];
    _titleTexField.borderStyle = UITextBorderStyleNone;
//    [_titleTexField addTarget:self action:@selector(titleAction:) forControlEvents:UIControlEventEditingChanged];
    _titleTexField.placeholder = @"添加标题";
    [self.view addSubview:_titleTexField];
    
    UIImageView * line = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleTexField.frame), 320, 1)];
    line.image = [UIImage imageNamed:@"line"];
    [self.view addSubview:line];
    
    self.noteTexField = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line.frame), 300, 300)];
    _noteTexField.borderStyle = UITextBorderStyleNone;
//    [_noteTexField addTarget:self action:@selector(noteAction:) forControlEvents:UIControlEventEditingChanged];
    _noteTexField.placeholder = @"请在这里输入内容...";
    [self.view addSubview:_noteTexField];
   
}

//- (void)titleAction:(UITextField *)title{
//    NSDictionary * dic = [[NSDictionary alloc] initWithObjectsAndKeys:title.text ,@"title", nil ];
//    [self.dataArray addObject:dic];
//    
//    NSString *DOUCU =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
//     NSString *PATH =[DOUCU stringByAppendingPathComponent:@"DATA.PLIST"];
//    [self.dataArray writeToFile:PATH atomically:YES];
//    
//}
//- (void)noteAction:(UITextField *)note{
//    
//    NSDictionary * dic = [[NSDictionary alloc] initWithObjectsAndKeys:note.text ,@"note", nil ];
//    [self.dataArray addObject:dic];
//    
//    NSString *DOUCU =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
//    NSString *PATH =[DOUCU stringByAppendingPathComponent:@"DATA.PLIST"];
//    [self.dataArray writeToFile:PATH atomically:YES];
//}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
