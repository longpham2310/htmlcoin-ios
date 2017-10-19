//
//  NewsDataProvider.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 13.10.17.
//  Copyright © 2017 QTUM. All rights reserved.
//

#import "NewsDataProvider.h"
#import "NetworkingService.h"
#import "NSString+HTML.h"
#import "TFHpple.h"
#import "QTUMFeedParcer.h"
#import "QTUMHtmlParcer.h"

@interface NewsDataProvider ()

@property (strong, nonatomic) NetworkingService* networkService;
@property (strong, nonatomic) QTUMFeedParcer* parcer;
@property (strong, nonatomic) QTUMHtmlParcer* htmlParcer;
@property (nonatomic, copy) QTUMNewsItems completion;

@end

@implementation NewsDataProvider

+ (instancetype)sharedInstance {
    
    static NewsDataProvider *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] initUniqueInstance];
    });
    return instance;
}

- (instancetype)initUniqueInstance {
    
    self = [super init];
    
    if (self != nil) {
        
        [self authorise];
        _networkService = [[NetworkingService alloc] initWithBaseUrl:@"https://api.medium.com/v1"];
        _networkService.accesToken = @"2df96f4271bd76950229972d74a9bc6d456bfae100b1201c90a8947f647733343";
        [self authorise];
    }
    return self;
}

-(void)authorise {
    
    QTUMFeedParcer* parcer = [[QTUMFeedParcer alloc] init];
    [parcer parceFeedFromUrl:@"https://medium.com/feed/@Qtum" withCompletion:^(NSArray<QTUMFeedItem *> *feeds) {
        
        QTUMHtmlParcer* htmlParcer = [[QTUMHtmlParcer alloc] init];
        
        for (QTUMFeedItem* feedItem in feeds) {
            
            [htmlParcer parceNewsFromHTMLString:feedItem.summary withCompletion:^(NSArray<QTUMHTMLTagItem *> *feeds) {
                
                NSLog(@"%@", feedItem.summary);
            }];
        }
        
        self.htmlParcer = htmlParcer;
        
    }];
    self.parcer = parcer;

}

-(void)getNewsItemsWithCompletion:(QTUMNewsItems) completion {
    
    self.completion = completion;
    
    __weak __typeof(self)weakSelf = self;

    QTUMFeedParcer* parcer = [[QTUMFeedParcer alloc] init];
    [parcer parceFeedFromUrl:@"https://medium.com/feed/@Qtum" withCompletion:^(NSArray<QTUMFeedItem *> *feeds) {
        
        QTUMHtmlParcer* htmlParcer = [[QTUMHtmlParcer alloc] init];
        
        NSMutableArray <QTUMNewsItem*>* news = @[].mutableCopy;
        
        for (QTUMFeedItem* feedItem in feeds) {
            
            [htmlParcer parceNewsFromHTMLString:feedItem.summary withCompletion:^(NSArray<QTUMHTMLTagItem *> *tags) {
                
                dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    
                    QTUMNewsItem* newsItem = [[QTUMNewsItem alloc] initWithTags:tags andFeed:feedItem];
                    [news addObject:newsItem];
                });
         
            }];
        }
        
        dispatch_async( dispatch_get_main_queue(), ^{
            
            if (weakSelf.completion) {
                weakSelf.completion(news);
            }
        });
        
        weakSelf.htmlParcer = htmlParcer;
        
    }];
    self.parcer = parcer;
}



@end
