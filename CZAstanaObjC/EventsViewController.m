//
//  EventsViewController.m
//  CZAstanaObjC
//
//  Created by Admin on 12/26/16.
//  Copyright © 2016 AAkash. All rights reserved.
//
#import "SettingsViewController.h"
#import "EventsViewController.h"
#import "NSString+CustomString.h"
#import "EventTableViewCell.h"
#import "HelperMethods.h"
#import <Parse/Parse.h>
#import "EventsView.h"
#import "Event.h"

@interface EventsViewController ()

@property (nonatomic) EventsView *eventsView;
@property (nonatomic) NSMutableArray *eventsArray;
@property (nonatomic) HelperMethods *helperMethods;

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self queryEventsFromParse];
    [self loadDataForLanguage];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

-(void)queryEventsFromParse {
    [self.eventsArray removeAllObjects];
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Events"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error == nil) {
            for (PFObject *object in objects) {
                NSString *descriptionKaz = object[[NSString descriptionKaz]];
                NSString* descriptionRus = object[[NSString descriptionRus]];
                NSString *nameKaz = object[[NSString nameKaz]];
                NSString *nameRus = object[[NSString nameRus]];
                NSString *dateString = [self.helperMethods stringFromDate:[object createdAt]];
                Event *event = [[Event alloc] initWithName:nameKaz andNameRus:nameRus andDescriptionKaz:descriptionKaz andDescriptionRus:descriptionRus andEventDate:dateString];
                [self.eventsArray addObject:event];
            }
        } else {
            NSLog(@"%@", error);
        }
        [self.eventsView.tableView reloadData];
    }];
    
}

-(void)loadDataForLanguage {
    if ([[SettingsViewController getCurrentLanguage] isEqualToString:[NSString languageKazakh]]) {
        self.eventsView.eventsLabel.text = @"Шаралар";
    } else {
        self.eventsView.eventsLabel.text = @"Мероприятия";
    }
}

-(void)setup {
    
    self.helperMethods = [[HelperMethods alloc] init];
    
    self.eventsArray = [NSMutableArray new];
    
    CGSize screenBounds = [UIScreen mainScreen].bounds.size;
    
    self.eventsView = [[EventsView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.width, screenBounds.height)];
    [self.view addSubview:self.eventsView];
    
    [self.eventsView.tableView setDelegate:self];
    [self.eventsView.tableView setDataSource:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.eventsArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString eventCell] forIndexPath:indexPath];
    Event *event = self.eventsArray[indexPath.row];
    cell.eventNameLabel.text = event.nameKaz;
    cell.dateStringLabel.text = event.dateString;
    return cell;
}

@end
