#coding:utf-8

from django.apps import AppConfig

#xadmin后台中文显示
class OperationConfig(AppConfig):
    name = 'operation'
    verbose_name = u'用户操作'
