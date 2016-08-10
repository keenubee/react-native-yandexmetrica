#import "RCTYandexMetrica.h"

@implementation RCTYandexMetrica {
  RCTResponseSenderBlock callback;
}

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

- (instancetype)init {
  if ((self = [super init])) {
  }
  return self;
}

#pragma mark RN Export
RCT_EXPORT_METHOD(reportEvent:(NSString *)message
                  onFailure:(RCTResponseSenderBlock)onFailure)
{
  self->callback = onFailure;
  
  [YMMYandexMetrica reportEvent:message
                      onFailure:^(NSError *error) {
                        self->callback(@[[self _NSError2JS:error], [NSNull null]]);
                      }];
};

#pragma mark Other

- (NSDictionary *)_NSError2JS:(NSError *)error {
  NSDictionary *jsError = @{
                            @"code" : [NSNumber numberWithLong:error.code],
                            @"domain" : error.domain,
                            @"description" : error.localizedDescription
                            };
  
  return jsError;
}


@end
