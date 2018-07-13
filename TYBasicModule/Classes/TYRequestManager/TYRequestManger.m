//
//  TYNetWorkManager.m
//  Basic
//
//  Created by TTSiMac on 2018/7/12.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import "TYRequestManger.h"
#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
#import "TYNetWorkConfig.h"
#import "TYMacrosFunction.h"
#import "TYShowHUD.h"
#import "TYCacheManager.h"

@interface TYRequestManger()

@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic,strong) TYNetWorkConfig *netConfig;
@end

@implementation TYRequestManger


+(instancetype)shareInstance
{
    static TYRequestManger *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
        [manager initialization];
    });
    return manager;
}
- (void)initialization
{
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    // 打开状态栏的等待菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
}

/**POST请求*/
-(void)NetRequestPOST:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    [self NetRequestPOST:requestURLString showHUD:NO needCache:NO WithParameter:parameter WithCacheBlock:nil WithSuccessBlock:successBlock WithFailureBlock:failureBlock];
}
/**GET请求*/
-(void)NetRequestGET:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    [self NetRequestGET:requestURLString showHUD:NO needCache:NO WithParameter:parameter WithCacheBlock:nil WithSuccessBlock:successBlock WithFailureBlock:failureBlock];
}
/**GET 自动缓存*/
-(void)NetRequestGETWithCache:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithCacheBlock:(CacheBlock)cacheBlock WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    [self NetRequestGET:requestURLString showHUD:NO needCache:YES WithParameter:parameter WithCacheBlock:cacheBlock WithSuccessBlock:successBlock WithFailureBlock:failureBlock];
}
/**POST 自动缓存*/
-(void)NetRequestPOSTWithCache:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithCacheBlock:(CacheBlock)cacheBlock WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    [self NetRequestPOST:requestURLString showHUD:NO needCache:YES WithParameter:parameter WithCacheBlock:cacheBlock WithSuccessBlock:successBlock WithFailureBlock:failureBlock];
}
/**POST ShowHUD*/
-(void)NetRequestPOST:(NSString *)requestURLString showHUD:(BOOL)showHUD WithParameter:(NSDictionary *)parameter WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    [self NetRequestPOST:requestURLString showHUD:YES needCache:NO WithParameter:parameter WithCacheBlock:nil WithSuccessBlock:successBlock WithFailureBlock:failureBlock];
}
/**GET ShowHUD*/
-(void)NetRequestGET:(NSString *)requestURLString showHUD:(BOOL)showHUD WithCacheBlock:(CacheBlock)cacheBlock WithParameter:(NSDictionary *)parameter WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    [self NetRequestGET:requestURLString showHUD:YES needCache:NO WithParameter:parameter WithCacheBlock:nil WithSuccessBlock:successBlock WithFailureBlock:failureBlock];
}
/**GET ShowHUD Cache*/
-(void)NetRequestPOST:(NSString *)requestURLString showHUD:(BOOL)showHUD needCache:(BOOL)needCache WithParameter:(NSDictionary *)parameter WithCacheBlock:(CacheBlock)cacheBlock WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    
    if ([self checkIsValideURL:requestURLString withParameter:parameter]==NO) {
        return;
    }
    if (showHUD==YES) {
        [TYShowHUD showLoadingView];
    }
    if (needCache==YES) {
        [TYCacheManager objectForKey:requestURLString]!=nil?cacheBlock([TYCacheManager objectForKey:requestURLString]):cacheBlock(nil);
    }
    [_sessionManager POST:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (showHUD==YES) {
            [TYShowHUD showLoadingView];
        }
        if (needCache==YES) {
            [TYCacheManager saveObject:responseObject forKey:requestURLString];
        }
        TYLogDebug(@"请求成功\n请求的接口:====%@\n 请求的参数====%@\n:返回的数据====:%@",requestURLString,parameter,responseObject);
        successBlock ? successBlock(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (showHUD==YES) {
            [TYShowHUD showLoadingView];
        }
        TYLogDebug(@"请求失败\n请求的接口:====%@\n 请求的参数====%@\n:返回的错误====:%@",requestURLString,parameter,error.description);
        failureBlock?failureBlock(error) : nil;
    }];
}
-(void)NetRequestGET:(NSString *)requestURLString showHUD:(BOOL)showHUD needCache:(BOOL)needCache WithParameter:(NSDictionary *)parameter WithCacheBlock:(CacheBlock)cacheBlock WithSuccessBlock:(SuccessBlock)successBlock WithFailureBlock:(FailureBlock)failureBlock
{
    
    if ([self checkIsValideURL:requestURLString withParameter:parameter]==NO) {
        return;
    }
    if (showHUD==YES) {
        [TYShowHUD showLoadingView];
    }
    if (needCache==YES) {
        [TYCacheManager objectForKey:requestURLString]!=nil?cacheBlock([TYCacheManager objectForKey:requestURLString]):cacheBlock(nil);
    }
    [_sessionManager GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (showHUD==YES) {
            [TYShowHUD dismissLoadingView];
        }
        if (needCache==YES) {
            [TYCacheManager saveObject:responseObject forKey:requestURLString];
        }
        TYLogDebug(@"请求成功\n请求的接口:====%@\n 请求的参数====%@\n:返回的数据====:%@",requestURLString,parameter,responseObject);
        successBlock ? successBlock(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (showHUD==YES) {
            [TYShowHUD dismissLoadingView];
        }
        TYLogDebug(@"请求失败\n请求的接口:====%@\n 请求的参数====%@\n:返回的错误====:%@",requestURLString,parameter,error.description);
        failureBlock?failureBlock(error) : nil;
    }];
}
#pragma mark - 上传图片
-(void)uploadImagesWithURL:(NSString *)requestURLString parameter:(NSDictionary *)parameter name:(NSString *)name images:(NSArray<UIImage *> *)images fileNames:(NSArray<NSString *> *)fileNames imageScale:(CGFloat)imageScale imageType:(NSString *)imageType progress:(UploadProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure
{
    
    if ([self checkIsValideURL:requestURLString withParameter:nil]==NO) {
        return;
    }
    if (images.count==0) {
        TYLogDebug(@"<====  !!注意 没有可上传的图片 ======>");
    }
    [_sessionManager POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSUInteger i = 0; i < images.count; i++) {
            // 图片经过等比压缩后得到的二进制文件
            NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ?: 1.f);
            // 默认图片的文件名, 若fileNames为nil就使用
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *imageFileName = [NSString stringWithFormat:@"%@%ld.%@",str,i,imageType?:@"jpg"];
            
            [formData appendPartWithFileData:imageData
                                        name:name
                                    fileName:fileNames ? [NSString stringWithFormat:@"%@.%@",fileNames[i],imageType?:@"jpg"] : imageFileName
                                    mimeType:[NSString stringWithFormat:@"image/%@",imageType ?: @"jpg"]];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLogDebug(@"上传图片成功:\n请求的接口:====%@\n 请求的参数====%@\n:返回的数据====:%@",requestURLString,parameter,responseObject);
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLogDebug(@"上传图片失败:\n请求的接口:====%@\n 请求的参数====%@\n:返回的错误====:%@",requestURLString,parameter,error.description);
        failure ? failure(error) : nil;
    }];
}
#pragma mark - 上传视频
-(void)uploadVideoWithURL:(NSString *)requestURLString parameter:(NSDictionary *)parameter name:(NSString *)name videos:(NSArray<NSData *> *)videos fileNames:(NSArray<NSString *> *)fileNames videoType:(NSString *)videoType progress:(UploadProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure
{
    if ([self checkIsValideURL:requestURLString withParameter:nil]==NO) {
        return;
    }
    if (videos.count==0) {
        TYLogDebug(@"<====  !!注意 没有可上传的视频 ======>");
    }
    [_sessionManager POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSUInteger i = 0; i < videos.count; i++) {
            // 默认图片的文件名, 若fileNames为nil就使用
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *imageFileName = [NSString stringWithFormat:@"%@%ld.%@",str,i,videoType?:@"mp4"];
            
            [formData appendPartWithFileData:videos[i]
                                        name:name
                                    fileName:fileNames ? [NSString stringWithFormat:@"%@.%@",fileNames[i],videoType?:@"mp4"] : imageFileName
                                    mimeType:[NSString stringWithFormat:@"video/%@",videoType ?: @"mp4"]];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLogDebug(@"上传视频成功:\n请求的接口:====%@\n 请求的参数====%@\n:返回的数据====:%@",requestURLString,parameter,responseObject);
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLogDebug(@"上传视频失败:\n请求的接口:====%@\n 请求的参数====%@\n:返回的错误====:%@",requestURLString,parameter,error.description);
        failure ? failure(error) : nil;
    }];
}
#pragma mark - 上传文件
-(void)uploadFileWithURL:(NSString *)requestURLString parameter:(NSDictionary *)parameter name:(NSString *)name filePath:(NSString *)filePath progress:(UploadProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure
{
    if ([self checkIsValideURL:requestURLString withParameter:nil]==NO) {
        return;
    }
    [_sessionManager POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSError *error = nil;
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        (failure && error) ? failure(error) : nil;
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TYLogDebug(@"上传文件成功:\n请求的接口:====%@\n 请求的参数====%@\n:返回的数据====:%@",requestURLString,parameter,responseObject);
        success ? success(responseObject) : nil;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        TYLogDebug(@"上传文件失败:\n请求的接口:====%@\n 请求的参数====%@\n:返回的错误====:%@",requestURLString,parameter,error.description);
        failure ? failure(error) : nil;
    }];
}
#pragma mark - 下载文件
-(void)downloadWithURL:(NSString *)requestURLString fileDir:(NSString *)fileDir progress:(UploadProgressBlock)progress success:(void (^)(NSString *))success failure:(FailureBlock)failure
{
    if ([self checkIsValideURL:requestURLString withParameter:nil]==NO) {
        return;
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURLString]];
    [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        dispatch_sync(dispatch_get_main_queue(), ^{
            progress ? progress(downloadProgress) : nil;
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //拼接缓存目录
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        //打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        //拼接文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        //返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull responseObject, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if(failure && error) {
            failure(error) ;
            TYLogDebug(@"下载文件失败:\n请求的接口:====%@\n 下载地址====%@\n:返回的错误====:%@",requestURLString,fileDir,error.description);
            return ;
        };
        
        TYLogDebug(@"下载文件成功:\n请求的接口:====%@\n 下载地址====%@\n:返回的保存地址====:%@",requestURLString,fileDir,filePath.absoluteString);
        success ? success(filePath.absoluteString /** NSURL->NSString*/) : nil;
        
    }];
}


/**判断请求是否可执行*/
- (BOOL)checkIsValideURL:(NSString *)requestUrl withParameter:(NSDictionary *)parameter
{
    if (kStringIsEmpty(requestUrl)) {
        TYLogDebug(@"网络请求的URL不能为空");
        return NO;
    }
    return YES;
}
@end












