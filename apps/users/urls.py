#coding:utf-8
__author__ = 'WangDy'
__date__ = '2017/7/27 9:28'

from django.conf.urls import url

from .views import UserInfoView,UploadImageView,UpdatePwdView,SendEmailCodeView,UpdateEmailView
from .views import MyCoursesView,MyFavOrgView,MyFavTeacherView,MyFavCourseView,MyMessageView


urlpatterns = [
    # 用户信息
    url(r'^info/$',UserInfoView.as_view(),name='user_info'),
    # 用户修改头像
    url(r'^image/upload/$',UploadImageView.as_view(),name='user_upload'),
    # 修改密码
    url(r'^update/pwd/$',UpdatePwdView.as_view(),name='update_pwd'),
    # 发送邮箱验证码
    url(r'^sendemail_code/$',SendEmailCodeView.as_view(),name='sendemail_code'),
    # 修改邮箱
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),
    #　我的课程
    url(r'^mycourses/$', MyCoursesView.as_view(), name='mycourses'),
    # 我收藏的机构
    url(r'^myfav/org/$', MyFavOrgView.as_view(), name='fav_org'),
    # 我收藏的讲师
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name='fav_teacher'),
    # 我收藏的课程
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name='fav_course'),
    # 我的消息
    url(r'^mymessages/$', MyMessageView.as_view(), name='mymessages'),
]





