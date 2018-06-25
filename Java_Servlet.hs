Java EE概念：
Java EE是一个开放的平台，它包括的技术很多，主要包括十三种核心技术（java EE就是十三
种技术的总称）。建立一个整全的概念。
要成为一个java EE程序员，必须掌握的技术是java,servlet,jsp。这是基础。
只有在上面的基础上再学 struts,hibernate,ejb,spring,webwork,jst等web框架。
J2ee的十三种技术(规范)
1. java数据库连接(JDBC)。——JDBC定义了4种不同的驱动：1.JDBC-ODBC桥,2.JDBC-nati
ve驱动桥3,JDBC-network桥4.纯java驱动。
2. Java命名和目录接口(JNDI)（它是为了对高级网络应用开发中的使用的目录基础结构的访
问。）。
3. 企业Java Beans(Enterprise Java Beans,EJB)（它提供了一个架构来开发和配置到客户端
的分布式商业逻辑，因此可以明显减少开发扩展性、高度复杂企业应用的难度。）。
4. JavaServer Pages(JSPs)。
5. Java servlets（servlets提供的功能大部分与JSP相同，JSP中大部分是HTML代码，其中只
有少量的Java代码，而servlets则相反，它完全使用Java编写，并且产生HTML代码。）。
6. Java IDL/CORBA（用得不多）。
7. Java 事务体系(JTA)/Java事务服务(JTS)（用得不多）。
8. JavaMail和JavaBenas激活架构(JavaBeans Activation Framework,JAF)。（JavaMail是一
个用来访问邮件服务的API）。
9. Java信使服务(Java Messaging Service,JMS)（JMS是一个用来和面向信息的中层通信的A
PI）。
10. 扩展标记语言(Extensible Markup Language,XML)。
11. 12. 13当前流行的及格框架 struts+hibernate+spring(ssh).
Java ee的开发环境(eclipse)
Eclipse是一个开源的、可扩展的集成开发环境，已经成为目前最流行的j2ee开发工具。
Eclipse安装后就可以开发java se的项目了，但不能开发java ee项目，需要安装web开发插件(lo
mboz或是myeclipe)
Eclipse的官网：http://www.eclipse.org
myeclipse的官网：http://www.myeclipside.com/
在java ee的开发中有几个重要的开发模式：
1.Model1模式 2.model2模式(model2x模式(用得少)) 3.mvc模式
一、Model1模式
Model1的基础是jsp文件，它由一些相互独立的jsp文件，和其它一些java class组成(不是必须
的)。这些jsp从HTTPRequest中获得所需要的数据，处理业务逻辑，然后将结果通过Respons
e返回前端浏览器。
从上面分析我们可以看到model1模式可以分为两类：
1． Model1(纯jsp技术，不带任何java class)。
2． Model1(jsp+java class)。
Model1模式的缺点：
1． 表现层和业务层混合在一起（乱！）。
2． 在开发过程中，不利于多人协同开发。
3． 不利于后期维护。
Model1模式的优点：
1． 简单，开发速度较快。
2． 比较适合开发小的项目。
二、model1(结合java class)开发模式，有些书上称：mv模式，即：m?model模型(java class,
业务逻辑层)，v?view视图(jsp，界面层)。
1．一个数据库应一个类：ConnDB.java(得到连接)。
2．数据库中的每一张表对应两个类：(1)UserBean.java(表示users表)类。(2)UserBeanCl.java
(业务逻辑，即对users表的操作)类。
如：
login.jsp输入数据，logincl.jsp通过调用java class(模型)处理数据，wel.jsp显示数据。这是
一种多么完美的开发模式。
不足之处：
1． Jsp技术主要做界面，但是logincl.jsp这里调用了java class(模型)，完成对用户验证，显
得有点怪怪的。
2． Wel.jsp是用于显示用户信息(显示数据)，但，wel.jsp除了显示数据，还调用了java class
(模型)，代码的优雅就荡然无存了，也不得于将来的分工。
3． Servlet技术处理页面的跳转是最快捷和方便的，难道我们就此不用了吗？
三、mvc开发模式：M(model模型)，V(view视图)，C(controller控制器)。
MVC是一个设计模式，它强制性的使应程序的输入、处理、和输出分开。使用MVC应用程序分
成三个核心部件：模型、视图、控制器。它们各自处理自己的任务。
M主要由java class来做，也可以是java bean、eib等
V由jsp来做
C由servlet来做
对上的例子进行改进：
1. 增加控制器(servlet)：将logincl.jsp用servlet来替代，发挥servlet充当控制中转的优
势。
2. 在控制器(servlet)中去调用模型(model)去完成用户验证，并准备要显示的用户信息数
据。
MVC开发模式的总结：
处理过程：首先控制器接收用户的请求，并决定应该调用哪个模型来进行处理，然后调用模型
来处理用户的请求并返回数据，最后控制器用相应的视图显示模型返回的数据，并通过浏览器呈现
给用户。
Mvc模式存在的缺点：
1． 工作量增加了。
由于开发者将一个应用程序分成了三个部件，所以使用MVC同时也意味着你将要管理比以
前更多的文件，这一点是显而意见的。这样好像我们的工作量增加了，但是请记住这比起它
所能带给我们的好处是不值一提。
2． 不适用小型项目，否则就是机关枪打蚊子。
3． 调试应用程序难度加大。
Mvc提倡模型和视图分离，这样也给调试应用程序带来了一定的困难。每个构件在使用之前
都需要经过彻底的测试。一旦你的构件经过了测试，你就可以毫不顾忌的重用它们了。
数据库中用户名是中文，中文乱码问题(一般是要查询数据时，有中文字符才需要转码)：
当提交表单时，表单中有中文，也会产生乱码。
解决中文乱码问题，有三种方法：
1． 重新转码，如，有String u=”是中文”; u=new String(u.getBytes(“iso-8859-1”),”gb2312”);
2． 使用过滤器来解决[详解]
3． 通过修改Tomcat配置servlet.xml文件[不太稳定.]，具体操作如下：
<Connector port="8080" protocol="HTTP/1.1" maxThreads="150"
connectionTimeout="20000" redirectPort="8443" />改为：
<Connector port="8080" protocol="HTTP/1.1" maxThreads="150"
connectionTimeout="20000" redirectPort="8443" URIEncoding=”gbk”/>
在<Connector>元素中增加属性URIEncoding，其值为”gbk，表示客户端请求传送来的值均
以gb2312的标准来编码，这样在业务处理中就不需要在对其编码进行转换，大在简化了程序，
提高了执行效率。
当request得到的是乱码时，可以这样解决(一定要这样写):
name=new String(request.getParameter(“username”).getBytes(“ISO8859_1”),”gb2312”);
图片链接边框去掉：用<a href="#"><img src="" border="0"></a>就去掉了.

Servlet部分
Servlet开发流程（这是servlet规范，没有理由，只有这么做）
1. 在%TOMCAT_HOME%\webapps下建一个文件夹如(myWebSite)，然后在该文件夹下新建
WEB-INF的文件夹下，写一个web.xml(该网站的配置信息)，建立一个classes的子文件夹，
也可以从加的目录ROOT下拷贝.
2. 开servlet（引入servlet-api.jar，否则编绎不了）。
3. 部署你的servlet，在web.xml文件中：添加代码(看例子)。
<servlet>
<!--给你的servlet取名,任意的-->
<servlet-name>hello</servlet-name>
<!--指明servlet的路径，（包名+类名）-->
<servlet-class>com.tsinghua.Hello</servlet-class>
</servlet>
<servlet-mapping>
<!--给你的servlet取名,任意的-->
<servlet-name>hello</servlet-name>
<!--这是在浏览器中输入的访问该servlet的url,任意的-->
<url-pattern>/sp</url-pattern>
</servlet-mapping>
4. 启动tomcat，访问你的servlet，在浏览器的地址栏输入http://127.0.0.1:8080/myWebSite/h
ello，回车就可看到servlet的输出。
开发servlet有三种方法
1. 实现接口servlet来编写
2. 继承GenericServet类(该写了servlet接口，所以有和servlet相同的方法service)。
3. 继承HttpServlet类(该类有doGet，doPost方法)
Servlet的生命周期
1. init()函数，用于初始化该servlet（类似于类的构造函数，该函数只会被调用一次(当用户第
一次访问该页面的servlet时被调用。)。)。

2. 业务逻辑函数(如：service,doGet,doPost等方法)（当用户每访问该servlet时，都会被调
用，它有两个参数：ServletRequest—用于获取客户端的信息，ServletResponse—用于向
客户端返回信息）。
3. destroy()函数，用于销毁servlet实例(释放内存)，只有如下三种情况才会周用（1.reload该s
ervlet(webApps)，2.关闭tomcat，3.关机）值行了这个函数后，这个网站内的所有的sessio
n和conTest都被释放，为空。
表单提交数据get请求和post请求的区别
1. 从安全方面看get<post，因为get提交的数据会在浏览器地址栏显示
2. 从提交的内容大小来看get<post， get提交的数据不能大于2K，面post提交的数据理论上不
受限制，但是实际编程中建议不要大于64K。
3. 从请求响应速度上看get>post，get要求服务器立即响应请求，而post请求可能形成一个队
列请求。
从以上几点看，表单提交方式(method)建议用post
在sevlet中打印的html语句，可以不加引号
同一用户的不同页面共享数据的四种方法
1． Cookie(小甜饼,在javax.servlet.http.*;这个包里面)（服务器在客户端保存用户的信息，比如
登录名，密码…就是cookie，数据量并不大，服务器端在需要的时候可以从客户端读
取。）。
Cookie的使用方法：①Cookie有点像一张表，分两列一个是名字，一个是值，数据类型都
是String。②创建Cookie(在服务器端创建)：Cookie c=new Cookie(String name,String val);
③将Cookie添加到客户端：response.addCookie(c); ④读取Cookie(从客户端读到服务
器)：Cookie[] allCookie=request.getCookies();c.getName();c.getValue();方法读取⑤
修改Cookie存在时间:c.setMaxAge(30);单位秒，为负则该cookie不会存储,为0则删除该coo
kie，如果不设置存在时间，那第该Cookie将不会保存。
2． sendRedirect(地址跳转，注意中文处理)
3． Session(会话技术)（当用户打开浏览器，访问某个网站时，服务器就会在服务器内存为该
浏览器分配一个空间，该空间被这个浏览器独占，这个空间就是session空间，其中的数据
默认存在时间为30min，可以修改(在conf—web.xml中修改)）。
Session的使用方法：①得到session：HttpSession hs=request.getSession(true);
②向session添加属性：hs.setAttribut(String name,Object val);③从session得到某个属性：
String name=hs.getAttribute(String name);④从session删除掉某个性性：hs.removeAtt
ribute(String name);⑤修改session的存在的时间：hs.setMaxInactiveInterval(20);单
位秒,为负则永远不超时,为0则马上超时。
因为session的各个属性要占用服务器的内存，因此软件公司都是在迫不得已的情况下才使
用。
注意：以文件—新建—窗口，的方式打开窗口，session的ID是不变的，也就是同一个sessi
on空间
4． 隐藏表单提交(form)（input type=hidden name=““ value=““），在提交该表单时，能一并提
交过去。（获取方式：req.getParameter(String name);）。
Cookie VS session
1． 存在的位置：cookie保存在客户端，session保存在服务器端。
2． 安全性：比较而言，cookie的安全性比session要弱。
3． 网络传输量：cookie通过网络在客户端与服务器端传输，而session保存在服务器端，不需
要传输。
4． 生命周期（20分钟为例）①cookie的生命周期是累计的，从创建时，就开始计时，20分钟
后cookie生命周期结束，cookie就无效。②session的生命周期是间隔的，从创建时开始时
计时，如在20分钟，没有访问过session，那么session信息无效，如果在20分钟内，比如第
19分钟时，访问过session，那么它的生命周期将重新开始计算。③另外，关机会造成sessi
on生命周期结束，但是对session没有任何影响。
使用ServletContext（和session一样，但是它所有的客户都可以访问）。
1. 得到ServletContext实例：this.getServletContext();
2. 你可以把它想像成一张表，这个和Session非常相似：每一行就是一个属性。添加属
性：setAttribute(String name,Object ob);
得到值：getAttribute(Stringname); 返回Object。
删除属性：removeAttribute(String name);
3. 生命周期：ServletContext中的属性的生命周期从创建开始，到服务器关闭而结束。
4. 使用ServletContext：的注意事项：因为存在ServletContext中的数据会长时间的保存
在服务器，会占用内存，因此我们建议不要向ServletContext中添加过大的数据……. 切
记

Servlet操作数据库注意事项
需要将连接数据库的3个jar包，拷贝到tomcat服务器
具体有两种方法可以：
(1).将.jar包拷贝到%tomcat%/lib文件夹
(2).或者在你的webapps目录的WEB-INF文件夹下建立一个lib文件夹，然后
把3个jar包拷贝到lib文件夹下
两种方法的区别：
第一种：所有webapps都可以使用3个jar包[公用库]。
第二种：只有放如jar包的那个webapps能使用jar包[独用lib库]。
特别要注意sql 注入漏洞：用户名和密码不能同时查询，可先用用户名查出密码，再用查出来
的密码与输入的密码进行比较。
分页技术(方法)
我们先讲讲分页的算法：
我们需要定义四个量，它们有各自的用处，如下：
int pageSize：每页显示多少条记录
int pageNow：希望显示第几页
int pageCount：一共有多少页
int rowCount：一共有多少条记录
说明：
pageSize是指定的（常量）。
pageNow是用户选择的（变量）。
rowCount是从表中查询得到的（是个变量）。
pageCount是计算出来的，该计算式为：
if(rowCount%pageSize==0)
{
pageCount=rowCount/pageSize;
}
else
{
pageCount=rowCount/pageSize+1;
}
然后查询数据库，我们可能很自然的想到，用
select 字段列表 from 表名 where id between ? and ?
但是如果表的某个id被删除了，那么某页可能就会少一条记录。
因此最终解决方法是如下语句：
select top pageSize 字段名列表 from 表名 where id not in
(select top pageSize *(pageNow-1) id from 表名)
翻页的链接可以用下拉框或输入文本
网站框架问题分析
1界面和业务逻辑放在一起（model1模式），有以下问题：
(1).有很多页面逻辑相似（如：操作数据库），有重复代码（一般一段代码重复了三次
或三次以上，就应该把这段代码封装到一个函数里面去）。
(2).整个框架没有清晰的层次关系，显得非常乱。
(3).代码一点也不优雅，可读性差，可维护性差。
2．进行分层(界面层、业务逻辑层)[mv模式]（m—>model模型，v—>view视图）
(1).将常用的代码（比如边接数据库），封装到类中。（现在java中javaBean一般与数据
库中表映射，充当表，如(UserBean.java(表示表)，UserBeanCl.java(业务逻辑)，Co
nnDB.java(得到连接)。)）。
3．在UserBeanCl中，查询数据库，返回查询结果集时，要返回ArrayList集合，而不是直
接返回ResultSet，原因如下：(rs代表ResultSet的一个对象)
(1).如果返回ResultSet，那么我们在使用ResutlSet时，是不能关闭该RestultSet相互关联
的数据库连接等资源，从而造成资源浪费。
(2).如果返回ResutlSet，我们只能使用rs.getInt(?)，rs.getString(?)…，这样的方法来得
到结果，代码的可读性不好，维护起来不方便。
(3).返回ArrayList集合方法（ArrayList作为中转，就可以尽快的关闭rs，数据库连接，同
时更能体现面向对象编程，代码可读性更好。）如下：
①将rs中的每一条记录，封装成一个UserBean对象ub。
②将封装成一个UserBean对象ub放入到ArrayList集合中，利于管理。③从ArrayLis
t结合中取出ub，然后使用。

Servlet中操作文件（和java 一样）
tomcat的配置:
1. 如何修改tomcat的端口(浏览器默认端口：80，可以不写)
(1) 需要启动两份tomcat服务器、服务占用了8080端口时可改
(2) 修改端口方法：修改%timcat%/conf/server.xml文件中port=“8080”数据修改成你需
要的端口即可。
(3) 端口号，是用两个字节存放，范围在1~65530，但是1~1024是有名端口，很有可
能被用，所以尽量设大一些。
2. 如何设置虚拟目录
(1) tomcat所在的磁盘空间不够用了、为了统一管理，希望放在某个特定的目录下，而
不是默认目录。
(2) 修改方法：修改%timcat%/conf/server.xml文件，在适当的位置(<Host></Host>中
最后)添加如下信息：<Context path=“/mysite(站点文件夹名)” docBase=“c:\mysite
(站点目录)” debug=“0”/>
3. 如何给tomcat的管理员设置密码
(1) 修改方法：修改%timcat%/conf/tomcat-users.xml文件中可以给管理员设置密码，
密码设置可以防止非法用户远程登录到tomcat。
(2) 在默认情况下，管理员的密码是空密码，这样不法分子可能远程发布一个站点，并
在某个servlet中加入一些可怕的语句（比如重启、关机…）。
(3) 利用密码为空搞破坏，步骤如下：
① 利用jdk自带的jar工具将有破坏的站点打包成*.war文件。使用jar工具需要配置jd
k的环境变量path=%JAVA_HOME%/bin; 或者在你编绎时写入 set path=%pat
h%;你的jdk目录\bin，这样即可在任何目录下使用jar命令，然后切换路径到需要
打包的那个文件夹目录下；打包的命令是：jar –cvf war 文件名 *.*
② 通过tomcat管理页面将站点发布到tomcat
③ 访问有破坏的代码的servlet，这样你就被黑了。
4. 如何设置数据源和连接池(公司常用!)（因为JDBC连接速度太慢）没测试出来，网上查
(1) 为什么使用：每次操作数据库，需要加载驱动才能得到一根连接，然后返回结果，
加载驱动是要花时间的。
(2) 解决方法：配置”连接池”与”队列池”。”连接池”事先与数据库连接好了，并有了几根
(可配置)连接，如果连接也中有空闲的连接，tomcat就分配给请求客户端；如果没
有空闲的连接，请求客户端将会在队列池中等待(时间可配置)，直到有连接。因为
直接取连接，所以速度快。
(3) 修改方法：有两种方法(1)通过tomcat管理界面来配置(2)修改配置文件。修改%timc
at%/conf/server.xml文件， 在指定的位置添加代码即可：
//**************************************************************
<Context path="/myWebSite1" docBase="D:\Program Files\Apache Software Foun
dation\Tomcat 6.0\webapps\myWebSite1" debug="0">
<!--name:给数据源设置名字(jndi) auth:表示该数据源是谁管理 type:类型-->
<Resource name="xuefeng" auth="Container" type="javax.sql.DataSource"/>
<ResourceParams name="xuefeng">
<!--工厂设置-->
<parameter>
<name>factory</name>
<value>org.apache.commons.dbcp.BasicDataSourceFactory</value>
</parameter>
<parameter>
<!--驱动设置，该驱动放在tomcat的common/lib下,或者放在该站点自己的lib目录下-
->
<name>driverClassName</name>
<value>com.microsoft.jdbc.sqlserver.SQLServerDriver</value>
</parameter>
<parameter>
<!--设置url-->
<name>url</name>
<value>jdbc:microsoft:sqlserver://192.168.190.2:1433;DatabaseName=spdb</valu
e>
</parameter>
<parameter>
<!--设置连接数据库的用户名-->
<name>username</name>
<value>sa</value>
</parameter>
<parameter>
<!--设置连接数据库的密码-->
<name>password</name>
<value>430482</value>
</parameter>
<parameter>
<!--在连接池中最大的激活连接数 -->
<name>maxActive</name>
<value>50</value>
</parameter>
<parameter>
<!--在连接池中最大的保留（空闲）连接数,用的人少时-->
<name>maxIdle</name>
<value>10</value>
</parameter>
<parameter>
<!--客户端在队列池中最大等待时间，按秒计算，-1指一直等，直到有连接-->
<name>maxWait</name>
<value>-1</value>
</parameter>
</ResourceParams>
</Context>
//**************************************************************
如果要加中文注释，则必需得在最前加如下语句：
<?xml version="1.0" encoding="gb2312"?>
//*************************************************************
(4) 如何使用：如果使用连接池的方式来连接数据库，那么就要这样：
Context ctt=new javax.naming.InitialContext();
DataSource ds=(DataSource)ctt.lookup("java:comp/env/数据源的名");//粉红//色的
是：得到配置环境保护，这是固定写法
Connection Ct=ds.getConnection();
