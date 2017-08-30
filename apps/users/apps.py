#coding:utf-8
from django.apps import AppConfig

#xadmin后台中文显示
class UsersConfig(AppConfig):
    name = 'users'
    verbose_name = u'用户信息'