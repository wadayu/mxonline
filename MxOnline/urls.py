"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url,include
from django.contrib import admin
#不调用views方法，直接调用html文件
from django.views.generic import TemplateView
from django.views.static import serve
import xadmin

from users import views
from organization.views import OrgView
from MxOnline.settings import MEDIA_ROOT


urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$',views.IndexView.as_view(),name='index'),
    # url(r'^$',TemplateView.as_view(template_name='index.html'),name='index'),
    url(r'^login/$',views.LoginView.as_view(),name='login'),
    url(r'^logout/$', views.LogoutView.as_view(), name='logout'),
    url(r'^register/$',views.RegisterView.as_view(),name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$',views.ActiveUserView.as_view(),name='user_active'),
    url(r'^forget/$',views.ForgetPwdView.as_view(),name='forget_pwd'),
    url(r'^reset/(?P<active_code>.*)/$',views.ResetView.as_view(),name='reset_pwd'),
    url(r'^modify_pwd/$',views.ModifyPwdView.as_view(),name='modify_pwd'),

    # 课程机构url配置
    url(r'^org/',include('organization.urls',namespace='org')),
    # 课程详情列表页url配置
    url(r'^course/',include('courses.urls',namespace='course')),
    # 配置上传图片的url
    url(r'^media/(?P<path>.*)$',serve,{'document_root':MEDIA_ROOT}),
    # 配置静态文件url
    #url(r'^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),
    # 配置用户url
    url(r'^users/', include('users.urls', namespace='users')),
]

# 全局404页面配置
handler404 = 'users.views.page_notfound'
# 全局500页面配置
handler500 = 'users.views.page_error'