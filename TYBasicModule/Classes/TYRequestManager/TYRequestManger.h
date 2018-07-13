//
//  TYRequestManger.h
//  Basic
//
//  Created by TTSiMac on 2018/7/12.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**定义返回请求数据的block类型*/
typedef void (^SuccessBlock) (id returnValue);
typedef void (^CacheBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^UploadProgressBlock)(NSProgress *progress);
typedef void (^FailureBlock)(id retutnValue);
#define TYAPIManager [TYRequestManger shareInstance]

@interface TYRequestManger : NSObject

+(instancetype)shareInstance;
/**
 POST请求
 */
-(void)NetRequestPOST:(NSString *)requestURLString
                        WithParameter: (NSDictionary *) parameter
                     WithSuccessBlock: (SuccessBlock) successBlock
                     WithFailureBlock: (FailureBlock) failureBlock;
/**
 GET请求
 */
- (void) NetRequestGET: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                    WithSuccessBlock: (SuccessBlock) successBlock
                    WithFailureBlock: (FailureBlock) failureBlock;
/**
 POST请求(自动缓存)
 */
-(void)NetRequestPOSTWithCache:(NSString *)requestURLString
                 WithParameter:(NSDictionary *)parameter
                WithCacheBlock:(CacheBlock)cacheBlock
              WithSuccessBlock: (SuccessBlock) successBlock
              WithFailureBlock:(FailureBlock)failureBlock;
/**
 GET请求(自动缓存)
 */
-(void)NetRequestGETWithCache:(NSString *)requestURLString
                WithParameter:(NSDictionary *)parameter
               WithCacheBlock:(CacheBlock)cacheBlock
             WithSuccessBlock: (SuccessBlock) successBlock
             WithFailureBlock:(FailureBlock)failureBlock;
/**
 POST请求(Mask)
 */
-(void)NetRequestPOST:(NSString *)requestURLString
             showHUD:(BOOL)showHUD
        WithParameter: (NSDictionary *) parameter
     WithSuccessBlock: (SuccessBlock) successBlock
     WithFailureBlock: (FailureBlock) failureBlock;
/**
 GET请求(Mask)
 */
- (void)NetRequestGET: (NSString *) requestURLString
              showHUD:(BOOL)showHUD
        WithCacheBlock:(CacheBlock)cacheBlock
         WithParameter: (NSDictionary *) parameter
      WithSuccessBlock: (SuccessBlock) successBlock
      WithFailureBlock: (FailureBlock) failureBlock;
/**
 POST请求(Mask Cache)
 */
-(void)NetRequestPOST:(NSString *)requestURLString
             showHUD:(BOOL)showHUD
            needCache:(BOOL)needCache
        WithParameter: (NSDictionary *) parameter
       WithCacheBlock:(CacheBlock)cacheBlock
     WithSuccessBlock: (SuccessBlock) successBlock
     WithFailureBlock: (FailureBlock) failureBlock;
/**
 GET请求(Mask Cache)
 */
- (void) NetRequestGET: (NSString *) requestURLString
              showHUD:(BOOL)showHUD
             needCache:(BOOL)needCache
         WithParameter: (NSDictionary *) parameter
        WithCacheBlock:(CacheBlock)cacheBlock
      WithSuccessBlock: (SuccessBlock) successBlock
      WithFailureBlock: (FailureBlock) failureBlock;
/**
 *  上传单/多张图片
 *
 *  @param name       图片对应服务器上的字段
 *  @param images     图片数组
 *  @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 *  @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 *  @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 *  @param progress   上传进度信息
 *
 */
- (void)uploadImagesWithURL:(NSString *)requestURLString
                 parameter:(NSDictionary *)parameter
                       name:(NSString *)name
                     images:(NSArray<UIImage *> *)images
                  fileNames:(NSArray<NSString *> *)fileNames
                 imageScale:(CGFloat)imageScale
                  imageType:(NSString *)imageType
                   progress:(UploadProgressBlock)progress
                    success:(SuccessBlock)success
                    failure:(FailureBlock)failure;
/**
 上传视频
 @param name 图片对应服务器上的字段
 @param videos  data数组
 @param fileNames 文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 @param videoType 文件类型,例:mp3,mp4(默认类型)....
 */
- (void)uploadVideoWithURL:(NSString *)requestURLString
                parameter:(NSDictionary *)parameter
                      name:(NSString *)name
                    videos:(NSArray<NSData *> *)videos
                 fileNames:(NSArray<NSString *> *)fileNames
                 videoType:(NSString *)videoType
                  progress:(UploadProgressBlock)progress
                   success:(SuccessBlock)success
                   failure:(FailureBlock)failure;
/**
 *  上传文件
 *
 *  @param name       文件对应服务器上的字段
 *  @param filePath   文件本地的沙盒路径
 *
 */
- (void)uploadFileWithURL:(NSString *)requestURLString
               parameter:(NSDictionary *)parameter
                     name:(NSString *)name
                 filePath:(NSString *)filePath
                 progress:(UploadProgressBlock)progress
                  success:(SuccessBlock)success
                  failure:(FailureBlock)failure;
/**
 *  下载文件
 *  @param fileDir  文件存储目录(默认存储目录为Download)
 *
 */
- (void)downloadWithURL:(NSString *)requestURLString
                fileDir:(NSString *)fileDir
               progress:(UploadProgressBlock)progress
                success:(void(^)(NSString *filePath))success
                failure:(FailureBlock)failure;



@end
