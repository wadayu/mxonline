#coding:utf-8
__author__ = 'WangDy'
__date__ = '2017/7/27 9:28'

from django.conf.urls import url

from .views import CourseListView,CourseDetailView,CourseInfoView,CourseCommentView,AddCommentsView,VideoPlayView

urlpatterns = [
    # 课程列表页
    url(r'^list/$',CourseListView.as_view(),name='course_list'),
    # 课程详情页
    url(r'^detail/(?P<course_id>\d+)/$',CourseDetailView.as_view(),name='course_detail'),
    # 章节详情页
    url(r'^info/(?P<course_id>\d+)/$',CourseInfoView.as_view(),name='course_info'),
    # 课程评论
    url(r'^comment/(?P<course_id>\d+)/$',CourseCommentView.as_view(),name='course_comment'),
    # 添加课程评论
    url(r'^add_comment/$',AddCommentsView.as_view(),name='add_comment'),
    # 视频播放url
    url(r'^video/(?P<video_id>\d+)/$',VideoPlayView.as_view(),name='video_play'),
]





