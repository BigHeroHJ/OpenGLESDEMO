//
//  OpenGLView1.h
//  OpenGLESDEMO
//
//  Created by XDS on 2018/1/9.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenGLView1 : UIView
{
    CAEAGLLayer* _eaglLayer;
    EAGLContext* _context;
    GLuint _colorRenderBuffer;
}
@end
