//
//  OpenGLViewController1.m
//  OpenGLESDEMO
//
//  Created by XDS on 2018/1/10.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import "OpenGLViewController1.h"
#import <GLKit/GLKit.h>



//定义一个结构体数组  包含三个GKLvector3 的数组 位置信息 三个坐标xyz
static const struct positionStruct vertices[] =
{
    {{-0.5f,-0.5f,0.0}},
    {{0.5f,-0.5f,0.0}},
    {{0.5f,0.5f,0.0}},
    {{-0.5f,0.5f,0.0}},
};


@interface OpenGLViewController1 ()
{
    EAGLContext     *_context;
    
    GLKView  *_view;
    GLuint    _vertexBufferID;
}
//GLKBaseEffect 提供了不依赖于所使用的OpenGL es 版本控制的渲染方法
@property (nonatomic, strong) GLKBaseEffect  *baseEffect;
@end

@implementation OpenGLViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContext];
    [self setupBaseEffect];
    [self render];
    
    
}
- (void)render{
    //设置当前上下文 OpenGL es 的context的清除颜色
    glClearColor(10/255.0f, 30/255.0f, 100/255.0f, 1);//设置背景颜色
    //生成colorbuffer bind  参数 制定要制定要生成的缓存标识符的数量 第二个是指针 指向标识符生成的内存保存地址
    glGenBuffers(1, &_vertexBufferID);
    
    //opengl es 保存不同类型的缓存标识符到当前OpenGL es 上下文的不同 部位 当时 任意时刻 每种 类型 不能绑定一个 如果使用了额两个定点属性的数组缓存 ，那么同意时刻 两个不能都被绑定
    //2,0 对glBindBuffer 只支持两种类型的缓存GL_ARRAY_BUFFER 和GL_ELEMENT_ARRAY_BUFFER
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBufferID);
  
    //复制存储定点数据到当前上下文
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
      // 初始化buffer contents  参数2  需要拷贝的 bytes size 大小  参数3   要拷贝的 bytes 的地址 参数4 hint:cache in GPU Memory
    //详细: 1：指定要更新当前的上下文中所绑定的缓存是哪个类型的
//         2：复制进这个缓存的字节数量
    //     3： 复制进这个缓存字节的地址
    //     4:提示这个缓存在未来的运算中可能将会被怎么样使用 GL_DYNAMIC_DRAW 会告诉opengl es 上下文 缓存内的数据会频繁的改变
}
- (void)setupBaseEffect
{
    _baseEffect = [[GLKBaseEffect alloc] init];
    //A Boolean value that indicates whether or not to use the constant color.
    _baseEffect.useConstantColor = GL_TRUE;//gl_true  就是 正常oc 中的yes no  在 opengl 中使用这些变量 来表示bool  是否使用自己弄的颜色 就是下一句指定的颜色
    
    //A constant color, used when per-vertex color data is not provided.
    _baseEffect.constantColor = GLKVector4Make(0.3, 1, 0.5, 1);//表示 red green blue alpha
}
- (void)setupContext
{
    _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
     _view = (GLKView *)self.view;
    _view.context = _context;
    [EAGLContext setCurrentContext:_context];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [_baseEffect prepareToDraw];
    
    glClear(GL_COLOR_BUFFER_BIT);//设置当前绑定的 缓存的像素颜色 是之前设置的glcleaColor 的颜色
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);//启动定点渲染
   
    //sizeof(struct positionStruct) sizeof 计算结构体是 加上前面的类型申明 不然报错
    
    glVertexAttribPointer(GLKVertexAttribPosition, 4, GL_FLOAT, GL_FALSE, sizeof(struct positionStruct), NULL);//(1. GLKVertexAttribPosition 指定当前绑定的缓存包包含每个顶点的位置信息  2. 指定每个位置顶点信息有三部分  3.每个部分都保存一个浮点型的值 4.未使用小数点固定的数据 ->GL_FALSE 5.步长大小 就是从顶点内存开始到下个顶点内存的 长度 也就是每个定点存储类型的大小 6.可以从当前绑定的顶点缓存的开始位置访问顶点数据)
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);//1， 怎么处理在绑定的顶点缓存内的顶点数据  2. 从指定内存需要渲染第一个顶点的位置和需要渲染的数量
}

- (void)viewDidUnload
{
    GLKView *view = (GLKView *)self.view;
    [EAGLContext setCurrentContext:_context];
    if(0 != _vertexBufferID){
        glDeleteBuffers(1, &_vertexBufferID);
        _vertexBufferID = 0;
    }
    view.context = nil;
    [EAGLContext setCurrentContext:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
