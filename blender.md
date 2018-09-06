# 基本操作

## 界面
右键: 选择物体
中键: 旋转
Shift+中键: 移动
A: 取消选择/选择全部

左键拖动右上角:视图增加
左键拖动右上角(拖向要关闭的视图):视图关闭
左键拖动: 关闭属性
T: 属性面板开/关
Ctrl+Alt+Q: 面板直接分为4个

Shift+C: 准星回中点

视图调整
1: 前视图
3: 侧视图
5: 设置为平视
7: 上视图
File->Save Startup File: 保存启动状态
界面可以随意设置,菜单就是Info类型的界面
Ctrl+up: 放大视图为全屏, 光标在哪个视图则操作的就是哪个视图
Ctrl+down: 缩小全屏的视图
Shift+Space: 全屏切换
Shift+F: 在视图中移动,WASD QE, 可以用来调整摄像机

怎样居中: Shift+C
怎样原地旋转查看,先居中,再旋转


中键拖动: 小菜单的左右移动

## 基本工具
小0表示小键盘上的0, 其它小xx都类似
3D视图,在小菜单上有 移动G 旋转R 缩放S, 按住中心与按住三个方向的箭头分别有不同的行为
GX GY GZ分别锁定在不同的轴上移动, 同时按住Shift为慢速移动, 进行精细调整
G->Shift+X则是不在x轴移动
SX3 在x轴上放大3倍
在不同方向旋转物体,最好在要旋转的平面视图内操作,这样不会产生其它方向的旋转.按R之后,直接输入数字,可以直接旋转到输入的度数.
Alt+R: 撤消物体的所有旋转操作

图层,在小菜单上的两堆方格子就是图层
Shift点选: 选择多个图层

K: 切割工具,切面
Shift+K: 切割工具,切块,而且只切选择的部分
Shift+H: 使未选中的部分不能被选中操作了, Alt+H 可以恢复

Ctrl+Alt+Shift+C: 设置轴心点位置，　
Shift+S -> Cursor to selected:移动准星到选择的物体处

W: 快捷菜单
subdivide  可以切分线或面

Ctrl+移动物体: 一次移动一个单位距离
Alt+右键：选一条线
Ctrl+右键：选一条线段
C: 自由选择, 按住选择，中键按住取消
Shift+R: 重复上一次操作
Ctrl+B: 倒角, 鼠标滚轮改变倒角边数

GG: 选中的点/边/面 在相连的边上滑动
    E: z滑移中按e, 设置端点, 不知道干啥用的
    F: 设置端点后按f, 两边的端点切换
    Alt: 滑移中按alt, 可以滑移超出边界
Shift+V: 也是滑移

Ctrl+Alt+Space: 以选中物体创建一个临时坐标, gxx (两下x)就是按着临时坐标移动
F6: 前一个操作的属性调节面板, 相当于T出现的面板的下面部分

## 视图操作
Shift+Z: 3D视图中实时渲染切换
Shift+F: 飞行模式, 跟打cs一样的查看方式, wasdeq控制方向

各视图参考图
第1种 手动分成四个视图,每个添加一张图
第2种 Ctrl+Alt+Q 自动分成四个视图,添加图片后设置图片的axis,每个视图一张图片(好处就是共用菜单条和选项面板,节省空间,缺点快捷键不太方便)

## 物体操作
不同的物体要选择后再编辑, 选了一个就只能编辑一个
Shift+A: 新增物体
M: 把选中的物体移到指定的图层
B: 矩形框圈选物体
Ctrl+左键: 手动圈选物体
Tab: 编辑和物体模式切换
Ctrl+Tab: 点/线/面 编辑方式切换
Ctrl+Shift+左键选择: 去除选中

E: 挤出. 先选中一个面,再E.(面板菜单中也有这个命令) 
Alt+E: 挤出的菜单选项
挤线时可以Ctrl+左键直接点
左键: 在移动的位置固定, 右键: 在原地固定
X: 删除物体
Z: 着色方式切换为线图的模式

小.(Del): 聚焦到原点


F: 根据选择的两条线或三个点或四个点产生一个面
    可以只选一个边，按鼠标的方向智能填充，但结果可能不理想

圈切:Loop cut and slide, 圈切可以用S放大/缩小, 点了S后,左键点着一根轴(xyx)移动即可
    Pageup PageDown 可以增加/减少圈数. 鼠标滚轮也可以
    直接按数字可以直接达到要的数量

Alt+O: 只影响相连项的衰减编辑
O: 衰减编辑开关, 可以用来制造山和海等
    Proportional Editing: 3D视图小菜单底部的小圆点, 开启后移动点线会对周围的点产生影响,滚轮控制影响范围的大小.

V: 分离顶点，可以不同方向的拆分
V: 撕开选择的边
Alt+V: 撕开边并填充撕开后的口子

Alt+M: 合并顶点
P: 分离物体，三种模式　按选中/按材料/按不连接的块

Alt+J: 合并两个物体，合并部分等
    可以合并两个三角形的面
L: 选择鼠标所在位置连通的点
Ctrl+L: 选择已选择的点连通的点
Ctrl+I: 反选
Ctrl+小+: 递进选择
Ctrl+小-: 递退选择
小/: 全屏显示选中的物体,并隐藏其它物体

Ctrl+A: 应用，把调整过程中的修改器应用到物体上
    缩放后的物体可以应用比例


## 面操作
I: 插入内插面
    Ctrl: 内插面调整好位置后,按住ctrl可以进行内外的调整
Y: 分离面, 操作点和线是相当于复制
W -> Bridge Edge Loops(桥接循环边): 把两个圈连接起来
Ctrl+F -> Grid Fill:自动填充多个网格
x -> Dissolve Faces(融并面): 把一个网格整合,形成一个多边形
Shift+1/3/7: 选中的面的前右上视图

## 组操作 多物体操作
Shift+G: 组操作菜单
选中多个物体，修改属性时按住alt就是全部修改，不按是修改最后一个选中的
Ctal+Alt+点击: 选择一圈的边


Shift+D: 复制一组选中的物体
Alt+D: 关联复制, 对源的操作影响到复制品

## 材质 贴图　灯光
.hdri 文件: 世界纹理文件
    免费高清HDRI下载： https://www.hdrihaven.com
U: UV展开菜单
    标记了缝合边就直接展开，没标记的就用智能展开
blender中纹理绘制模式: 可以直接画材质了
Ctrl+E: 打开边的菜单
    Mark Seam: 标记缝合边
S: 画uv图时, 可以吸取颜色
在模型上绘制纹理时,可以用遮罩盖住(小菜单条的一个按钮), 再用ctrl, a, b, c 等键选择出可以画的部分
    Ctrl+I 是反选
## 平滑 渲染
3D视图->Tool->shading->smooth(Object Mode): 可以用少的分面增加平滑度

渲染标签中有降噪(Denoising)选项，可以在低采样数下渲染出更好的效果


F12: 查看渲染结果

材质
属性面板中的小球图标
Diffuse: 漫反射颜色
Specular: 反光度 
   intensit: 浓度,越大反光度越高
Hardness: 硬度,也就是扩散度,越接近镜面则反光度高扩散度低

不同的物体可以设置不同的材质, 同一个物体的不同表面也可以设置不同的材质

贴图
贴图图标就在材质的右边


*MarkCup*
圆柱 --拉伸顶面 挤压-> 杯壁 --次分面 环切-> 圆滑杯 --挤压-> 杯把 --切割 删面 连接-> 连好杯把 --Proportional Editing-> 把手加弯度



*小狗*
生成一个面,删除剩一条线,用线圈成一半的形状
镜像得到完整的面
挤压出整个身体,缩小屁股,多切两圈,调整到符合身体
调整身体时留出的面长出前后腿,根据图调整好,再长出尾巴,调整是个细活,一样慢慢调
然后调整面部,也比较复杂
用面镜像作两个耳朵,挤出厚度
然后眼睛是球
鼻子是个球, 鼻子中间有表面,要删掉


## 修改器 Modifiers 图标:扳手
subdivision surface: 表面细分　(次分面)  与圈切配合,防止在不想次分的面上添加次分面
    Ctrl+数字: 表面细分快捷键

mirror: 镜面对称

boolean: 布尔，两个物体运算, Object模式下使用
    有一个默认没打开的boolean工具，可以快速执行boolean操作
skin: 表皮修改器，可以为骨架生成表皮
    制作小青蛙
    松散点控制表皮，根点控制表皮
    Ctrl+A: 对点范围进行缩放
armature: 骨架

: 曲线和阵列修改器


## 动画

添加关键动画
Dope sheet 视图　-> 选择　Action Editor 模式，在伸直和握拳状态下各插入关键帧
I: 插入
Alt+I: 删除关键帧

Alt+A: 播放动画
Shift+Alt+A: 倒放
左右方向:前一帧后一帧
Shift+上下箭头: 前后十帧
M: 在时间轴上按m是添加一个标记,
Ctrl+M: 修改标记的名称
## 摄像机
小0: 切换到摄像机视角界面
Ctrl+小0: 如果有多个摄像面,这是切换视角到选中的摄像机上
Ctrl+B: 在时间轴视图起作用, 把摄像机绑定到标记 (可以在到达不同标记时切换到不同的摄像机)

镜头的推拉摇移跟甩
GZZ: 镜头的推拉
GXX/GYY: 镜头的移, 左右和上下
RZ: 摇镜头,围着一个目标转, 把旋转中心设置成游标, 游标放到物体那就可以了
跟:镜头跟着目标跑
甩:就是啪甩一边去了,啥也看不到了

## 雕刻
Alt+M: 清除遮罩
Shift: 各种笔刷切换到平滑模式
Alt+B: 框选部分内容显示

## 骨架操作
Shift+A: Armature 可以添加骨架
编辑模式下可以修改,E可以挤出
*物体设置骨架时,BoneEnvelopes复选框要选中*
*左右对称的骨架,中央的要从前视图开始做*
*反向关节不用空白物体,自己建立一个骨架作为反向关节的控制器,并删除原来的父子关系*

骨架的不同显示状态
x-Ray: 被包围的骨架可以在右属性的骨架标签中设置x-Ray(在材质->Display中),使它可以透过物体被看到
Envelope: 显示骨架影响的顶点范围.可以用放大缩小设置影响的范围

Ctrl+Tab: 模式切换
Shift+I: 添加反向关节
(在两块骨头的情况下，先选一个，再Shift选另一个，然后　Shift+I)
BoneConstraint中可以设置反向关节控制的关节数量，０是控制所有一条线上的
Shift+E: 挤出对称的骨架，需要先在设置中勾选x-Axis Mirror(选项从tools标签页移到了Options标签页)
Ctrl+P: 把一起选的最后一根骨头设置为其它的parent(keep offset不需要连接到一起)
Alt+P: 断开父级关系
Ctrl+Shift+C: Post模式下，骨头添加Constraint
Shift+]: 逐级选中子骨头

Ctrl+A -> Apply pose as rest pose: 恢复原始状态

在Post模式下可以添加Constraint, 在小菜单post菜单中
EditMode -> Armature -> FlipNames: 左右改名，　名字中的L R转换

Weight Paint 模式可以查看骨头对顶点的影响力
    F: 修改笔刷的大小

Constraints:
tract to: 指向，　从骨指向主骨的大头
child of: 跟随移动/旋转, 用来弯腰　等 (set inverse)
copy location: 位置同步移动　(space值设置为local space)
    influence: 影响力
copy rotation: 旋转同步
Action: 绑定一个动作
Limit Scale: 限制缩放，使缩放范围只能在一个范围内

复制约束：先选没有约束的骨头（可以选多个），再选有约束的骨头，在pose模式下的pose小菜单中 -> Constraints->Copy ...

反向约束中设置pole: 在约束属性面板中，pole target选择armature, bone选择新建的骨头，如elbow_L(设置手臂pole时做的)

weight 涂抹工具中，weight表示要达到的结果，　strength表示达到的速度 *因为这个涂抹，鼠标左右键不能互换，否则这里有bug*

    


*骨架动画*
--骨架制作
加脊柱骨,命名
对称出两条腿的骨架,命名
对称出手臂和手指,命名
设置反向关节,修改反向控制长度
给腰上设置总的parent骨头->root
设置踮脚的关节
手臂控制骨头的parent设置为脖子
背部弯区的约束，逐节做, 约束copy
让控制部件伸出模形, 复制，放大，约束, 设置　parent 等方式

--骨架绑定
孤立控制用的骨头
绑定骨架，骨架需要在pose模式下，先模型再shift选骨架, Ctrl+P , 选　With Automatic Weights
(自动张力(权重，对周围点的影响力))

调整一些细节部位的weight, *调整时要打开x Mirror(在options选项中)*

手部骨架设置
使用Constraint -> copy rotation, 然后属性中勾选offset, space设置为local space.
左手握拳，创建一个动画的动作　leftFingerAction,每个手指第一节绑定约束Action到一个骨头的缩放上(先绑定一根，再复制)
手臂添加pole控制(肘关节生出骨头，父亲设置为体外的手控制器．回到pose模式，设置pole target和bone)
    手臂骨头的扭曲调整（armature小菜单中　-> Bone roll -> Recalculate roll[快捷键Ctrl+N], xyz三个方向都要调整）
    上一步调的右手的话，左手就是反过来的，属性中pole angle设置为180就转回来了．
模型与骨架绑定之后，如果要调整模型，把骨架和模型都调整到ObjectMode,全选中再移动，旋转，缩放．
    新建一个Curve -> Nurbs circle,在Object mode下，把模型的骨架的parent一起设置为这个圆圈，就可以用圆圈控制这两个了．
    上一步会造成对原来的缩放操作有影响．把每个手指的约束中world space改为local space就可以了.
控制骨架部分单独移到一个层，其它骨头就可以不用显示了

做动画
调整姿势，时间轴设定好位置，I 插入 LocRot (搁置和旋转)第一次，
在pose mode下，选中所有骨骼，Ctrl+C 复制，Ctrl+Shift+V, 反向并粘贴，I 再次插入　LocRot
插入完整走两步的动画，中间可以设置一下过渡关键帧
打开Dope sheet视图，保存一个walkAction动画．
打开NLA Editor,添加之后设置重复次数就可以多次播放了．
NLA Editor中插入位置的关键帧，人物就可以动了．
调整动画速度，默认是一段弧线，两边慢中间快的．
    用Graph Editor,把弧线改成直线．(选中线两端，小菜单->key->Handle type->Vector)
    T: Handle type的快捷键
输出渲染的动画
    先调整摄影机的路线和旋转方向，使它可以保持主角在镜头范围内
    属性面板的render选项卡，调整输出的画面大小和输出格式

*注意事项*
1. 如果是mirror建立的模型，需要先把模型固定下来再绑定，否则会出现人手的奇怪拉伸
2. 如果模型是多个不同的物体合成的，小的部件需要单独绑定，Ctrl+P后选择Bone选项
3. 多个物体的模型也可以合并为一个，方法：先选没绑定的，再选绑定好了的，然后Ctrl+J合并．然后选择小部件所的有点，在Object Data中选择对应的骨头-> Assign


带走东西
使用copy location约束，在接触前后两帧中设置influence为0和1,在前后产生变化．
加入一个空物体，使空来同步位置，空与被带走的物体成为父子，来保持两个物体的相对位置．

## 加载模型
Ctrl+G: 组合物体
File -> Link -> 选择group载入
Ctrl+Alt+P: Object -> Make proxy..



捡苹果
捡苹果时做了两个target?? 为什么

推箱子

景深及移焦动画
设定摄影机的Depth of Field, 聚焦到一个空物体(focus)上
Compositing 视图组合，使用node editor 视图
Shift+A 添加　Defocus node, 关联image 和　depth <-> z, 勾选　use z buffer, F-stop是光圈，减小f-stop可以产生景深效果
移动focus则出现景深变化效果

非线性动画
连接多个动作: 作出多个action, 在NLA Editor中连接起来
一个动作插入另一个: NLA Editor中可以设置多个轨道，将要插入的放在上面的轨道中，并清除后面空轨道的作用．
NAL Editor -> 小菜单 -> Add -> Add transition: 可以自动连接两段动作，计算中间的插入值

边走边挥手


## 工作日常系列


## 台湾人的优兔
姓郑，名不知道。有没有新的，你可以去他的优兔看看：三W.优兔.com/playlist_show/id_17652956.html

## 硬表面基础系列
1. 尖分化
Ctrl+F -> 尖分化
Shift+G: 选择相似点/线/面 等
2. 排列圆洞
Ctrl+Shift+B: 点倒角
3. 反细分与间隔弃选
4. 第一阶段总结和硬边使用
5. 软选择影响和环切使用
6. looptool + 游标简单使用
Shift+Alt+s: to 球形
7. 第二阶段总结+挤出
7.2 挤出+镜像+轴心设置
8. 软选择影响+环切
9. 游标基准使用+套索选择+倒角进阶
10. 采样坐标点+倒角综合应用


## 插件
animated node 只有个名字,这是什么鬼

## 辅助软件
CrazyBump  从贴图中生成各种其它贴图，法线　粗糙度　等

## 内置插件
auto tile size: 自动调整渲染时tile的大小
Pie menu: 各种快捷菜单
Loop Tools: 各种loop小工具
Edit Tools2: mesh edit tools
relax: 

## 高级插件
makehuman 人体建模用的



[五个免费的插件](https://www.blenderguru.com/articles/must-blender-addons)  
Import Images as Planes : 把图片导入为平面 ,搜索image, 自带.
Amaranth Toolset: 功能集合,很多.
Edit Linked Library: 直接跳转到链接对象的源文件,进行编辑.
Node Wrangler: node 编辑的功能集合
Render Auto Tile Size:自动调整渲染单元

[12个好用的插件介绍](https://www.blenderguru.com/articles/12-useful-blender-addons-everyone-should-use)  

[五个免费五个收费](https://www.lauren-hodges.com/blog/2015/9/23/top-5-favorite-free-and-paid-blender-addons)  
Archimesh: 一些基本建筑的模型
Sapling: 添加树
Multi Object UV Editing: 编辑多个对象的uv展开图, 便于合并统一管理
Blendermada - Blender Material Database: 渲染贴图材料库

[blender中国社区插件](http://www.zcool.com.cn/article/ZNjIwODQw.html)
Object:一键工具箱
System:项目文件夹+

[blender中国视频](http://v.youku.com/v_show/id_XMTUzNDMzMjU1Ng==.html?spm=a2h0j.11185381.listitem_page1.5!3~A&f=27332013&from=y1.2-3.4.3)  
UV Squares : 可以把uv修改为等大小的块


[cursor_control](https://svn.blender.org/svnroot/bf-extensions/contrib/py/scripts/addons/cursor_control/)   
[wiki](https://wiki.blender.org/index.php/Extensions:2.6/Py/Scripts/3D_interaction/Cursor_Control)  





