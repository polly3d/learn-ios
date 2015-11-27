#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic,strong) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL *chosen;

@property (nonatomic,getter=isMatched) BOOL *matched;


- (int)match:(NSArray *) otherCards;


@end