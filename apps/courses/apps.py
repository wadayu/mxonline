#coding:utf-8
from django.apps import AppConfig

#xadmin后台中文显示
class CoursesConfig(AppConfig):
    name = 'courses'
    verbose_name = u'课程管理'