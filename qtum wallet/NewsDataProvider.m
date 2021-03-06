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


@interface NewsDataProvider ()

@property (strong, nonatomic) QTUMFeedParcer* parcer;
@property (strong, nonatomic) QTUMHtmlParcer* htmlParcer;
@property (nonatomic, copy) QTUMNewsItems completion;
@property (strong, nonatomic) NSArray <QTUMNewsItem*>* news;
@property (nonatomic, strong) NSOperationQueue* storingQueue;

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
    
    if (self != nil) { }
    return self;
}

#pragma mark - Custom Accessors

-(NSOperationQueue*)storingQueue {
    
    if (!_storingQueue) {
        _storingQueue = [[NSOperationQueue alloc] init];
        _storingQueue.maxConcurrentOperationCount = 1;
    }
    return _storingQueue;
}

-(void)getNewsItemsWithCompletion:(QTUMNewsItems) completion {
    
    self.completion = completion;
    
    __weak __typeof(self)weakSelf = self;
    
    NSMutableArray <QTUMNewsItem*>* news = @[].mutableCopy;
    
    QTUMFeedParcer* parcer = [[QTUMFeedParcer alloc] init];
    
    //1 parcing feed from medium

    [parcer parceFeedFromUrl:@"https://medium.com/feed/@HTMLCOIN" withCompletion:^(NSArray<QTUMFeedItem *> *feeds) {
        
        for (QTUMFeedItem* feedItem in feeds) {
            
            QTUMNewsItem* newsItem = [[QTUMNewsItem alloc] initWithTags:nil andFeed:feedItem];
            [news addObject:newsItem];
        }

        [weakSelf storeNews:news];
        
        dispatch_block_t block = ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (weakSelf.completion) {
                    weakSelf.completion(weakSelf.news);
                }
            });
        };
        
        [weakSelf.storingQueue addOperationWithBlock:block];
    }];

    self.parcer = parcer;
}

-(void)getTagsFromNews:(QTUMNewsItem*) newsItem withCompletion:(QTUMTagsItems) completion {
    
    QTUMFeedItem* feedItem = newsItem.feed;
    QTUMHtmlParcer* htmlParcer = [[QTUMHtmlParcer alloc] init];
    __weak __typeof(self)weakSelf = self;
    [completion copy];
    [htmlParcer parceNewsFromHTMLString:feedItem.summary withCompletion:^(NSArray<QTUMHTMLTagItem *> *tags) {
        
        newsItem.tags = tags;
        
        if (completion) {
            completion(tags);
        }
        [weakSelf updateNewsWithNewsItem:newsItem];
    }];
    self.htmlParcer = htmlParcer;
}

-(void)updateNewsWithNewsItem:(QTUMNewsItem*) newsItem {
    
    __weak __typeof(self)weakSelf = self;

    dispatch_block_t block = ^{
        
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"kArchivedNewsDict"];
        NSMutableDictionary *newsDict = [[NSKeyedUnarchiver unarchiveObjectWithData:data] mutableCopy];
        if (newsDict) {
            [newsDict setObject:newsItem forKey:newsItem.identifire];
            data = [NSKeyedArchiver archivedDataWithRootObject:[newsDict copy]];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"kArchivedNewsDict"];
        }
        [weakSelf unarchiveNews];
    };
    
    [self.storingQueue addOperationWithBlock:block];
}

-(NSArray <QTUMNewsItem*>*)obtainNewsItems {
    
    if (!self.news) {
        [self unarchiveNews];
    }
    return self.news;
}

-(void)storeNews:(NSArray <QTUMNewsItem*>*) news {
    
    __weak __typeof(self)weakSelf = self;
    
    dispatch_block_t block = ^{
        
        NSDictionary* oldNews = [weakSelf createDictWithNews:weakSelf.news];
        NSDictionary* newNews = [weakSelf createDictWithNews:news];
        NSMutableDictionary* uniqueNews = [oldNews mutableCopy];
        
        for (NSString* identifire in newNews.allKeys) {
            if (![oldNews objectForKey:identifire]) {
                [uniqueNews setObject:newNews[identifire] forKey:identifire];
            }
        }
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:uniqueNews];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"kArchivedNewsDict"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        weakSelf.news = [weakSelf sortNews:[uniqueNews allValues]];
    };
    
    [self.storingQueue addOperationWithBlock:block];
}

-(void)unarchiveNews {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"kArchivedNewsDict"];
    NSDictionary *newsDict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (newsDict) {
        self.news = [self sortNews:[newsDict allValues]];
    }
}

-(NSDictionary<NSString*,NSArray <QTUMNewsItem*>*>*)createDictWithNews:(NSArray <QTUMNewsItem*>*) news {
    
    NSMutableDictionary* newsDict = @{}.mutableCopy;
    for (QTUMNewsItem* newsItem in news) {
        [newsDict setObject:newsItem forKey:newsItem.identifire];
    }
    
    return [newsDict copy];
}

-(NSArray <QTUMNewsItem*>*)sortNews:(NSArray <QTUMNewsItem*>*) news {
    
    NSArray *sortedArray = [news sortedArrayUsingComparator:^NSComparisonResult(QTUMNewsItem* news1, QTUMNewsItem* news2) {
        
        return [news2.feed.date compare:news1.feed.date];
    }];
    
    return sortedArray;
}

#pragma mark - Cancelabe

-(void)cancelAllOperations {
    [self.parcer cancel];
    [self.htmlParcer cancel];
}


@end
