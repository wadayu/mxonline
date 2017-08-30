#coding:utf-8
__author__ = 'WangDy'
__date__ = '2017/7/11 15:33'

import xadmin

from .models import Course,Lesson,Video,CourseResource
from organization.models import CourseOrg

class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail','degree','learn_times','students','fav_nums','image','click_nums','add_time','get_zjnums','go_to']
    search_fields = ['name', 'desc', 'detail', 'degree','students','fav_nums','image','click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','image','click_nums','add_time']
    ordering = ['-click_nums'] #默认倒序排列
    readonly_fields = ['click_nums','fav_nums',]  #默认只读，不可修改
    exclude = ['students']  #后台隐藏该字段
    inlines = [LessonInline,CourseResourceInline] #在课程信息编辑里展示章节信息和课程资源信息
    list_editable = ['desc','degree'] #可在课程列表中直接修改这两个字段
    # refresh_times = [30,60] #自动刷新时间

    #添加课程的时候课程机构自动统计课程数
    def save_models(self):
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download','add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course', 'name', 'download','add_time']

xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)

