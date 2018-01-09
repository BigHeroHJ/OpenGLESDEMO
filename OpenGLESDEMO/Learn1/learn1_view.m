//
//  learn1_view.m
//  OpenGLESDEMO
//
//  Created by Lemon HOLL on 2018/1/8.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//http://blog.csdn.net/cdut100/article/details/45753227
//http://blog.csdn.net/colorapp/article/details/36899341


//在iOS 中使用opengl es 有两种方式
//1.GLKViewController和GLKView
//2.CAEAGLLayer+EAGLContext
#import <UIKit/UIKit.h>
#import "learn1_view.h"
#import <QuartzCore/QuartzCore.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>


@interface learn1_view()


@end

@implementation learn1_view

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
        [self setupContext];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        [self render];
    }
    return self;
}

- (void)dealloc
{

}

+ (Class)layerClass
{
    return [CAEAGLLayer class];//返回当前视图需要返回指定的 layer 是哪一种
}

- (void)setupLayer
{
    _eaLayer = (CAEAGLLayer *)self.layer;
   // self.backgroundColor = [UIColor redColor];
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
    if(![EAGLContext setCurrentContext:_context]){
        exit(1);
    };
}

//OpenGL保存 了一系列缓存（buffers），用于绘制各方面的内存块。例如：glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)，就是将这两个值进行逻辑或通知OpenGL清除两个不同的缓存－颜色缓存（color buffer）和深度缓存（depth buffer）
- (void)setupRenderBuffer
{
    //创建render buffer
    glGenRenderbuffers(1,&_colorRenderBuffer);
    //绑定一个buffer
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:_eaLayer];
}

//创建一个 frame buffer （帧缓冲区）
//Frame buffer也是OpenGL的对象，它包含了前面提到的render buffer，以及其它后面会讲到的诸如：depth buffer、stencil buffer 和accumulation buffer。
//前两步创建frame buffer的动作跟创建render buffer的动作很类似。
//最后一步  glFramebufferRenderbuffer 它让你把前面创建的buffer render依附在frame buffer的GL_COLOR_ATTACHMENT0位置上。
- (void)setupFrameBuffer
{
    GLuint frameBuffer;
    glGenBuffers(1, &frameBuffer);
    //glBindBuffer  &  glBindFrameBuffer   & glBindRenderBuffer 三种 使用 场景？
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
}

//1. 调用glClearColor ，设置一个RGB颜色和透明度，接下来会用这个颜色涂满全屏。
//
//2. 调用glClear来进行“填色”动作（大概就是photoshop那个油桶）。还记得前面说过有很多buffer的话，这里我们要用到GL_COLOR_BUFFER_BIT来声明要清理哪一个缓冲区。
//
//3. 调用OpenGL context的presentRenderbuffer方法，把缓冲区（render buffer和color buffer）的颜色呈现到UIView上。
- (void)render{
    //这两句 顺序 对调 就出不来了？
   glClearColor(5.0/255.0f, 14.0/255.0, 104.0/255.0, 1);//GL_STENCIL_BUFFER_BIT
    glClear(GL_COLOR_BUFFER_BIT );//GL_DEPTH_BUFFER_BIT
    
     //GL_COLOR_BUFFER_BIT 三种
   // GL_RENDERBUFFER_WIDTH
//    glColorMask(5.0/255.0f, 10.0/255.0, 104.0/255.0, 1);
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}
@end
