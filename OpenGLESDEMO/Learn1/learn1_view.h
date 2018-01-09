//
//  learn1_view.h
//  OpenGLESDEMO
//
//  Created by Lemon HOLL on 2018/1/8.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface learn1_view : UIView
{
    CAEAGLLayer  *_eaLayer;
    EAGLContext  *_context;//EAGLContext对象管理OpenGL绘制所需要的所有信息
    GLuint   _colorRenderBuffer;
}
@end
