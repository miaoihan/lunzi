<%@ page import="vo.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="vo.User" %>
<%@ page import="dao.BlogDao" %><%--
  User: han
  Date: 16-5-1
  Time: 上午11:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>
<% User user = (User) session.getAttribute("user"); %>
<html>
<head>
    <title>blogs</title>
    <link rel='stylesheet' id='qzhai-css' href='http://qzhai.net/000/wp-content/themes/No.7_qzhai/css/style.css?ver=4.5'
          type='text/css' media='all'/>
    <script type='text/javascript'
            src='http://qzhai.net/000/wp-content/themes/No.7_qzhai/js/jquery.min.js?ver=4.5'></script>
    <link rel='https://api.w.org/' href='http://qzhai.net/000/wp-json/'/>
    <link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://qzhai.net/000/xmlrpc.php?rsd"/>
    <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://qzhai.net/000/wp-includes/wlwmanifest.xml"/>
</head>
<body>
<%
    Integer uid = user.getId();
    /**  查询当前用户的blogs   */
    List<Blog> blogs = new BlogDao().getAll(uid);
%>
<div id="main" class="wp uk-grid uk-grid-collapse" style="max-width: 1120px;">
    <div class="uk-width-small-1-1 uk-width-medium-1-4 uk-width-large-1-6">
        <div id="head" data-uk-sticky="{boundary: true,top:80}">
            <div class="uk-panel">
                <div class="tx">
                    <a href="#my-head" data-uk-modal> <img
                            src="http://qzhai.net/000/wp-content/uploads/2016/03/tx2.jpg"/>
                    </a></div>
                <h1 class="uk-panel-title"><a href="blogs.jsp"><%= user.getNikname() %>
                </a></h1>
                <span> </span>
                <div class="my uk-grid-collapse uk-grid uk-grid-width-1-3">
                    <div>
                        <span><%= blogs.size() %></span>
                        <span><i class="uk-icon-file-text"></i></span>
                        <a href="http://qzhai.net/000/%e5%bd%92%e6%a1%a3" title="文章"
                           data-uk-tooltip="{pos:'bottom'}"></a>
                    </div>
                    <div>
                        <span>2</span>
                        <span><i class="uk-icon-folder"></i></span>
                        <a href="http://qzhai.net/000/%e5%88%86%e7%b1%bb" title="分类"
                           data-uk-tooltip="{pos:'bottom'}"></a>
                    </div>
                    <div>
                        <span>3</span>
                        <span><i class="uk-icon-tags"></i></span>
                        <a href="http://qzhai.net/000/%e6%a0%87%e7%ad%be" title="标签"
                           data-uk-tooltip="{pos:'bottom'}"></a>
                    </div>
                </div>
                <ul id="nav-top" class="nav uk-nav">
                    <li id="menu-item-5" class=" uk-active"><a href="/blogs.jsp">首页</a></li>
                    <li id="menu-item-6" class=""><a href="#">详情</a></li>
                    <li id="menu-item-20" class=""><a href="blogs.jsp"><%= user.getNikname() %>
                    </a></li>
                </ul>
                <form class="s uk-form" id="searchform" method="get" action="http://qzhai.net/000">
                    <input class="uk-width-1-1 " type="text" value="" name="s" id="s" placeholder="搜索"/>
                </form>
            </div>
            <div id="my-head" class="uk-modal">
                <div class="uk-modal-dialog-blank uk-height-viewport">
                    <a class="uk-modal-close uk-close"></a>
                    <div class="uk-grid uk-flex-middle" data-uk-grid-margin="">
                        <div class="uk-width-medium-1-2 uk-height-viewport uk-cover-background uk-row-first"
                             style="background-image: url(' http://qzhai.net/000/wp-content/uploads/2016/04/geren.jpeg ');"></div>
                        <div class="uk-width-medium-1-2 p">
                            <h4>不努力</h4><br/>
                            谁也给不了 你 想要的生活<br/>
                            <br/>
                            ……
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="content" class="uk-width-small-1-1 uk-width-medium-3-4 uk-width-large-5-6 uk-grid uk-grid-collapse">
        <div class="uk-width-small-1-1 uk-width-medium-3-4 uk-width-large-7-10">
            <div id="index" class="bs">
                <h4>最新文章</h4>
                <div id="list">
                    <% for (Blog b : blogs) { %>
                    <article class="article"><h1><a href="http://qzhai.net/000/archives/16"><%= b.getTitle() %>
                    </a></h1>
                        <p><a href="#"><img
                                src="http://qzhai.net/000/wp-content/uploads/2015/12/111-e1452232566209.jpeg"/></a><%= b.getContent() %>
                            <time><br>2015年12月30日</time>
                        </p>
                    </article>
                    <% } %>
                </div>
            </div>
            <ul class="uk-pagination">
                <li class='uk-active'><span>1</span></li>
                <li><a href='http://qzhai.net/000/page/2'>2</a></li>
                <li><a href="http://qzhai.net/000/page/2">»</a></li>
            </ul>
        </div>
        <div id="sidebar" class="uk-width-small-1-1 uk-width-medium-1-4 uk-width-large-3-10">
            <ul class="ul">
                <li><h4><a href="newBlog.jsp"><span><i class="uk-icon-file-text"></i></span>&nbsp发表新文章</a></h4>
                    <%--<div class="textwidget"></div>--%>
                </li>
                <li><h4>最新评论</h4>
                    <ul class="uk-list com">
                        <li class="uk-clearfix"><a href="http://qzhai.net/000/archives/10#comment-8"><img alt=''
                                                                                                          src='http://gravatar.duoshuo.com/avatar/998fb109a0e59aa816ce08b77115a405?s=36&#038;d=retro&#038;r=g'
                                                                                                          srcset='http://gravatar.duoshuo.com/avatar/998fb109a0e59aa816ce08b77115a405?s=72&amp;d=retro&amp;r=g 2x'
                                                                                                          class='avatar avatar-36 photo'
                                                                                                          height='36'
                                                                                                          width='36'/>
                            <div class="author">my</div>
                            <div class="content">赞一个</div>
                        </a></li>
                        <li class="uk-clearfix"><a href="http://qzhai.net/000/archives/7#comment-6"><img alt=''
                                                                                                         src='http://gravatar.duoshuo.com/avatar/b161e99a67ac3f25349628f27eb40b47?s=36&#038;d=retro&#038;r=g'
                                                                                                         srcset='http://gravatar.duoshuo.com/avatar/b161e99a67ac3f25349628f27eb40b47?s=72&amp;d=retro&amp;r=g 2x'
                                                                                                         class='avatar avatar-36 photo'
                                                                                                         height='36'
                                                                                                         width='36'/>
                            <div class="author">Hedilict</div>
                            <div class="content">好主题，就是太贵了，买不起。</div>
                        </a></li>
                        <li class="uk-clearfix"><a href="http://qzhai.net/000/archives/1#comment-3"><img alt=''
                                                                                                         src='http://gravatar.duoshuo.com/avatar/c9aa3b7330425eba306a3434237bdd7a?s=36&#038;d=retro&#038;r=g'
                                                                                                         srcset='http://gravatar.duoshuo.com/avatar/c9aa3b7330425eba306a3434237bdd7a?s=72&amp;d=retro&amp;r=g 2x'
                                                                                                         class='avatar avatar-36 photo'
                                                                                                         height='36'
                                                                                                         width='36'/>
                            <div class="author">顶顶顶级</div>
                            <div class="content">不错的模板</div>
                        </a></li>
                        <li class="uk-clearfix"><a href="http://qzhai.net/000/archives/16#comment-2"><img alt=''
                                                                                                          src='http://gravatar.duoshuo.com/avatar/008db1fdc14e6c9eda6bd49150753920?s=36&#038;d=retro&#038;r=g'
                                                                                                          srcset='http://gravatar.duoshuo.com/avatar/008db1fdc14e6c9eda6bd49150753920?s=72&amp;d=retro&amp;r=g 2x'
                                                                                                          class='avatar avatar-36 photo'
                                                                                                          height='36'
                                                                                                          width='36'/>
                            <div class="author">sr</div>
                            <div class="content">“首页”上方的“5 2 3”不论点哪个都是这个页面，这算是个bug吧！</div>
                        </a></li>
                    </ul>

                </li>
            </ul>
            <ul class="ul">
                <li><h4>标签</h4>
                    <div class="post-tags">
                        <a href='http://qzhai.net/000/archives/tag/%e6%96%87%e8%89%ba%e9%9d%92%e5%b9%b4'
                           class='tag-link-4 tag-link-position-1' title='1个话题' style='font-size: 12px;'>文艺青年</a>
                        <a href='http://qzhai.net/000/archives/tag/%e6%b3%aa' class='tag-link-5 tag-link-position-2'
                           title='1个话题' style='font-size: 12px;'>程序员</a>
                        <a href='http://qzhai.net/000/archives/tag/%e5%a7%91%e5%a8%98'
                           class='tag-link-6 tag-link-position-3' title='1个话题' style='font-size: 12px;'>浪子</a></div>

                </li>
                <li class="adimg"><a href="http://qzhai.net/2016-03-546.html" target="_blank"><img
                        src="http://qzhai.net/000/wp-content/uploads/2016/01/016699565eaff132f875ae342bd9aa-683x1024.jpg"></a>
                </li>
            </ul>
        </div>


    </div>

    <script>var ajaxhome = 'http://qzhai.net/000/';
    var ajaxloading_code = '<div class="loading" style="left:45%"><img src="http://qzhai.net/000/wp-content/themes/No.7_qzhai/img/box.gif" alt="" /></div>';
    var ajaxignore_string = new String('#, /wp-, .pdf, .zip, .rar, /goto'); </script>
    <script type='text/javascript' src='http://qzhai.net/000/wp-includes/js/wp-embed.min.js?ver=4.5'></script>
    <script type='text/javascript' src='http://qzhai.net/000/wp-content/themes/No.7_qzhai/js/app.js?ver=4.5'></script>
    <a href="#" class="top" data-uk-smooth-scroll style="display:none"><i class="uk-icon-angle-up"></i></a>

</div>
</body>
</html>
