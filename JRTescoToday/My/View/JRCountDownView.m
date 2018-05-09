//
//  JRCountDownView.m
//  caculateTime
//
//  Created by apple on 2017/12/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JRCountDownView.h"
#import <sys/sysctl.h>
#define WeakSelf __weak typeof(self) weakSelf = self
@interface JRCountDownView ()
//Minute
@property (weak, nonatomic) IBOutlet UILabel *minuteALabel;
@property (weak, nonatomic) IBOutlet UILabel *minuteBLabel;

//second
@property (weak, nonatomic) IBOutlet UILabel *secondALabel;
@property (weak, nonatomic) IBOutlet UILabel *secondBLabel;

@end
@implementation JRCountDownView


- (void)countTimeWithEndTime:(NSString *)endTime{
//    endTime = [self timeTransformUnix:@"1970-01-01 00:30:00.000000"];
    if (endTime.length == 0) endTime = @"1800";
    WeakSelf;
    double currentTime = [endTime doubleValue];
    __block double timeout= currentTime; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1*NSEC_PER_SEC, 0); // 每1秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                // 倒计时结束，关闭处理
            
            });
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                double currentTime = timeout;
                int currentHour  = currentTime / 3600;
                int currentMinute = (currentTime - currentHour*3600) / 60;
                int currentSeconds = currentTime - currentHour*3600 -currentMinute*60;
                int currentMsec = (currentTime - currentHour*3600 - currentMinute*60 - currentSeconds)*1000;
                NSLog(@"%d",currentMsec);

                weakSelf.minuteALabel.text = [NSString stringWithFormat:@"%d",currentMinute/10];
                weakSelf.minuteBLabel.text = [NSString stringWithFormat:@"%d",currentMinute%10];
                weakSelf.secondALabel.text = [NSString stringWithFormat:@"%d",currentSeconds/10];
                weakSelf.secondBLabel.text = [NSString stringWithFormat:@"%d",currentSeconds%10];
                
            });
            timeout--;

        }
    });
    dispatch_resume(_timer);
//    self.myTimer = _timer;


}
#pragma mark - 从发起请求到结束请求的时间差
- (void)dealWithServerTime {
    uint64_t realLocalTime = 0;
    uint64_t curLocalTime = [self uptime] ;//发起网络请求时间
    //----------------------------------------/网络请求/----------------------------------------
    NSString *serverTimeStr = @"";//请求成功后获取下单时间
    NSString *serverEndTimeStr = @"";//请求成功后获取下单结束时间
    //-----------------------------------------------------------------------------------------
    uint64_t lastSyncLocalTime = [self uptime];//网络请求结束时间
    uint64_t serverTime = [[self timeTransformUnix:serverTimeStr] doubleValue]; //服务器下单时间戳
    uint64_t serverEndTime = [[self timeTransformUnix:serverEndTimeStr] doubleValue]; //服务器下单结束时间戳
    if (serverTime != 0 && lastSyncLocalTime != 0) {
        realLocalTime = serverTime + (curLocalTime - lastSyncLocalTime);
    }
    else {
        realLocalTime = [[NSDate date] timeIntervalSince1970]*1000;
    }
     uint64_t limitTime = 0;
    limitTime =serverEndTime - realLocalTime;
    [self countTimeWithEndTime:[NSString stringWithFormat:@"%llu",limitTime]];
    
}
#pragma mark - 系统运行时间
- (NSTimeInterval)uptime
{
    struct timeval boottime;
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    size_t size = sizeof(boottime);
    
    struct timeval now;
    struct timezone tz;
    gettimeofday(&now, &tz);
    
    double uptime = -1;
    
    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0)
    {
        uptime = now.tv_sec - boottime.tv_sec;
        uptime += (double)(now.tv_usec - boottime.tv_usec) / 1000000.0;
    }
    return uptime;
}
#pragma mark - 转换为时间戳
- (NSString *)timeTransformUnix:(NSString *)timeStr {
    //获取系统时间 转换格式
    NSDateFormatter * Ft = [[NSDateFormatter alloc] init];
    [Ft setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone * timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    [Ft setTimeZone:timeZone];
    //时间戳的值
    NSDate * localDate = [Ft dateFromString:timeStr];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[localDate timeIntervalSince1970]];
    NSLog(@"时间戳的值:timeSp:%@",timeSp);
    return timeSp;
}
@end
