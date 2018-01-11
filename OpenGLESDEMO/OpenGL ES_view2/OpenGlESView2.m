//
//  OpenGlESView2.m
//  OpenGLESDEMO
//
//  Created by Lemon HOLL on 2018/1/10.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import "OpenGlESView2.h"


@interface OpenGlESView2()
{
    EAGLContext   *_context;
}
@end

@implementation OpenGlESView2


//+ (Class)class
//{
//    return [GLKView class];
//}


- (void)setupContext
{
    _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
