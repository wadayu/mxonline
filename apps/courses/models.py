#coding:utf-8
from datetime import datetime

from django.db import models
from organization.models import CourseOrg,Teacher


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg,verbose_name=u'课程机构',null=True,blank=True)
    name = models.CharField(max_length=50,verbose_name=u'课程名')
    desc = models.CharField(max_length=300,verbose_name=u'课程描述')
    detail = models.TextField(verbose_name=u'课程详情')
    degree = models.CharField(max_length=5,choices=(('cj',u'初级'),('zj',u'中级'),('gj',u'高级')),verbose_name=u'课程难度')
    learn_times = models.IntegerField(default=0,verbose_name=u'学习时长(分钟)')
    students = models.IntegerField(default=0,verbose_name=u'学习人数')
    fav_nums = models.IntegerField(default=0,verbose_name=u'收藏人数')
    teacher = models.ForeignKey(Teacher,verbose_name=u'讲师',null=True,blank=True)
    image = models.ImageField(upload_to='courses/%Y/%m',verbose_name=u'封面图片')
    click_nums = models.IntegerField(default=0,verbose_name=u'点击数')
    category = models.CharField(max_length=20,verbose_name=u'课程类别',default=u'后端开发')
    tag = models.CharField(max_length=10,verbose_name=u'课程标签',default=u'')
    knows = models.CharField(max_length=300,verbose_name=u'课程须知',default='')
    teacher_tell = models.CharField(max_length=300,verbose_name=u'老师告诉你',default='')
    is_banner = models.BooleanField(default=False,verbose_name=u'是否轮播')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return  self.name
    # 获取章节数
    def get_zjnums(self):
        return self.lesson_set.all().count()
    get_zjnums.short_description = '章节数'

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe('<a href=http://www.baidu.com>跳转</a>')
    go_to.short_description = '跳转'

    # 获取学习用户
    def get_learn_users(self):
        return  self.usercourse_set.all()[0:5]
    # 获取课程的所有章节
    def get_course_lesson(self):
        return self.lesson_set.all()


class Lesson(models.Model):
    course = models.ForeignKey(Course,verbose_name=u'课程')
    name = models.CharField(max_length=100,verbose_name=u'章节名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_lesson_video(self):
        # 获取章节视频
        return self.video_set.all()

class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name=u'章节')
    name = models.CharField(max_length=100, verbose_name=u'视频名')
    url = models.CharField(max_length=200, verbose_name=u'访问地址',default='')
    learn_times = models.IntegerField(default=0, verbose_name=u'学习时长(分钟)')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u'课程')
    name = models.CharField(max_length=100, verbose_name=u'名称')
    download = models.FileField(upload_to='course/resource/%Y/%m',verbose_name=u'资源文件',max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name