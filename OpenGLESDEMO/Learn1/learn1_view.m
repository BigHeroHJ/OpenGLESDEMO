//
//  learn1_view.m
//  OpenGLESDEMO
//
//  Created by Lemon HOLL on 2018/1/8.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import "learn1_view.h"


@interface learn1_view()
{
    CAEAGLLayer  *_eaLayer;
    EAGLContext  *_context;//EAGLContext对象管理OpenGL绘制所需要的所有信息
}

@end

@implementation learn1_view

+ (Class)layerClass
{
    return [CAEAGLLayer class];//返回当前视图需要返回指定的 layer 是哪一种
}

- (void)setupLayer
{
    _eaLayer = (CAEAGLLayer *)self.layer;
    _eaLayer.opaque = YES;//CAEAGLLayer默认是透明的
}

- (void)setupContext
{
    EAGLRenderingAPI renderApi = kEAGLRenderingAPIOpenGLES2;
    _context = [[EAGLContext alloc] initWithAPI:renderApi];//初始化 OpenGL2.0s api EAGLRenderingAPI 为一个枚举 申明1.0 2.0 3.0 版本的OpenGL es
    
    if(_context == nil){
        exit(1);
    }
    
    //设置为当前 current context
    [EAGLContext setCurrentContext:_context];
}

- (void)setupRenderBuffer
{
    //创建render buffer
    glGenRenderbuffer
}
@end
